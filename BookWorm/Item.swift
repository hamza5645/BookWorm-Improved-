//
//  Item.swift
//  BookWorm
//
//  Created by Hamza Osama on 14/06/2023.
//

import Foundation
import SwiftData

@Model
class Book {
    @Attribute(.unique) var name: String
    var author: String
    var language: String
    var count: Int
    var thoughts: String
    var rating: Int16
    var date: Date
    
    init (name: String, author: String, language: String, count: Int, thoughts: String, rating: Int16, date: Date) {
        self.name = name
        self.author = author
        self.language = language
        self.count = count
        self.thoughts = thoughts
        self.rating = rating
        self.date = date
    }
}
