//
//  Item.swift
//  BookWorm
//
//  Created by Hamza Osama on 14/06/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
