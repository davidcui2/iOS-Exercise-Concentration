//
//  Card.swift
//  Concentration
//
//  Created by Zhihao Cui on 09/05/2020.
//  Copyright © 2020 Generation Z. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var touchCard: () -> Void
    
    var body: some View {
        Button(action: self.touchCard) {
            Text(card.isFaceUp ? card.value : "")
                .font(.system(size: 60))
                .frame(minWidth: 60, idealWidth: 80, maxWidth: .infinity, minHeight: 65, idealHeight: 150, maxHeight: 150, alignment: .center) // minHeight to help with landscape mode
                .background(card.isMatched ? Color.clear : Color.orange)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(isFaceUp: true, isMatched: false, id: 1, value: "🎃"), touchCard: {})
    }
}
