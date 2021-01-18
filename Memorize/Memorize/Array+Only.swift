//
//  Array+Only.swift
//  Memorize
//
//  Created by Will on 1/4/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
