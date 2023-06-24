//
//  DetailView.swift
//  BookWorm
//
//  Created by Hamza Osama on 14/06/2023.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var books: [Book]
    
    var dateFormatter: DateFormatter {
        let formater = DateFormatter()
        formater.dateStyle = .short
        formater.timeStyle = .none
        return formater
    }
    
    var body: some View {
        NavigationView {
            ForEach(books) { book in
                VStack {
                    Text("Book name : \(book.name)")
                    Text("Book author : \(book.author)")
                    Text("Book language : \(book.language)")
                    Text("How many times you have read this book : \(book.count)")
                    Text("Your thoughts on this book : \(book.thoughts)")
                    Text("\(book.rating)")
                    Text("\(book.date, formatter: dateFormatter)")
                }
            }
//            .navigationTitle("\(book.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DetailView()
        .modelContainer(for: Book.self, inMemory: true)
}
