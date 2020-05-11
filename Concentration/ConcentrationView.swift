//
//  ContentView.swift
//  Concentration
//
//  Created by Zhihao Cui on 09/05/2020.
//  Copyright © 2020 Generation Z. All rights reserved.
//

import SwiftUI

struct ConcentrationView: View {
    @ObservedObject var game = Concentration(pairOfCards: 6)
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack( spacing: 16) {
                ForEach(game.cards.indices) {rIndex in
                    HStack {
                        ForEach(self.game.cards[rIndex].indices) {cIndex in
                            CardView(card: self.game.cards[rIndex][cIndex], touchCard: {self.game.flipCard(on: rIndex, at: cIndex)})
                        }
                    }
                }
                
                Spacer()
                
                Text("Flip Count: \(game.flipCount)")
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConcentrationView()
    }
}
