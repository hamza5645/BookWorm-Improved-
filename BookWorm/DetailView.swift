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
    
    var body: some View {
        NavigationView {
            ForEach(books) { book in
                VStack {
                    Text("\(book.name)")
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
