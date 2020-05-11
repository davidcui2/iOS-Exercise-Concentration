A simple card game called [Concentration](https://en.wikipedia.org/wiki/Concentration_(card_game)).

#  Background

Exercise folloing watching [Stanford CS 193P - Developing iOS 11 Apps with Swift](https://itunes.apple.com/us/course/developing-ios-11-apps-with-swift/id1309275316), but trying to implement with Swift UI.

# Notes

Some reuseable notes 

## Layout

Some useful autolayout-like view adjustments.

Below expands will try to expand the view to use the full screen size

```swift
.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
```

## SwiftUI Previews

Different devices

```swift
static var previews: some View {
    ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
        NavigationView {
            LandmarkList()
        }
        .previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
    .environmentObject(UserData())
}
```
