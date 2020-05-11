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
                .frame(width: 80, height: 150)
                .background(card.isMatched ? Color.clear : Color.orange)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: 1, value: "🎃"), touchCard: {})
//            .previewLayout(PreviewLayout.fixed(width: 80, height: 150))
    }
}
