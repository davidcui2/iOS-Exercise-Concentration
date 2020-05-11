//
//  Card.swift
//  Concentration
//
//  Created by Zhihao Cui on 11/05/2020.
//  Copyright © 2020 Generation Z. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var isFaceUp = false;
    var isMatched = false;
    var id: Int;
    var value: String;
}
