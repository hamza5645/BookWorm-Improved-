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
            ScrollView {
                ForEach(books) { book in
                    VStack(alignment: .leading) {
                        Text("Book name : \(book.name)")
                            .padding()
                        Text("Book author : \(book.author)")
                            .padding()
                        Text("Book language : \(book.language)")
                            .padding()
                        Text("How many times you have read this book : \(book.count)")
                            .padding()
                        Text("Your thoughts on this book : \(book.thoughts)")
                        
                            .padding()
                        Text("Your rating for this book : \(book.rating)")
                            .padding()
                        Text("When did you read this book : \(book.date, formatter: dateFormatter)")
                            .padding()
                    }
                }
                //            .navigationTitle("\(book.name)")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    DetailView()
        .modelContainer(for: Book.self, inMemory: true)
}
