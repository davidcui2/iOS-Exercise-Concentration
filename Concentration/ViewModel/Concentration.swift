//
//  Concentration.swift
//  Concentration
//
//  Created by Zhihao Cui on 09/05/2020.
//  Copyright © 2020 Generation Z. All rights reserved.
//

import Foundation

class Concentration: ObservableObject {
    @Published var cards : [[Card]] // Rows of cards
    
    @Published var flipCount = 0
    
    var indexOfOneAndOnlyFaceUpCard: (r: Int, c: Int)?
    
    func flipCard(on row:Int, at column: Int) {
        if !cards[row][column].isMatched {

            flipCount += 1
            
            if (indexOfOneAndOnlyFaceUpCard == nil) {
                for rIndex in cards.indices {
                    for cIndex in cards[rIndex].indices {
                        cards[rIndex][cIndex].isFaceUp = false
                    }
                }
                cards[row][column].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = (r: row, c: column)
            } else {
                cards[row][column].isFaceUp = true
                if (cards[row][column] == cards[indexOfOneAndOnlyFaceUpCard!.r][indexOfOneAndOnlyFaceUpCard!.c]) {
                    cards[row][column].isMatched = true
                    cards[indexOfOneAndOnlyFaceUpCard!.r][indexOfOneAndOnlyFaceUpCard!.c].isMatched = true
                }
                indexOfOneAndOnlyFaceUpCard = nil
            }
        }
    }
    
    
    init(pairOfCards: Int) {
        var allCards = [Card]()
        var emojis = ["🎃", "👻", "🤡", "😈", "😹", "🦉", "🐒", "🦑"]
        assert(pairOfCards < emojis.count, "Number of emojis to use is not enough for pair of cards")
        
        for index in 0..<pairOfCards {
            let card = Card(id: index, value: emojis.remove(at: Int.random(in: 0..<emojis.count)))
            allCards += [card, card]
        }
        
        self.cards = allCards.shuffled().chunked(into: 4) // Each row has 4 cards
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
