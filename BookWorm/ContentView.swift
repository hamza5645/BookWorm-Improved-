//
//  ContentView.swift
//  BookWorm
//
//  Created by Hamza Osama on 14/06/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var book: [Book]
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(book) { book in
                    NavigationLink {
                        DetailView()
                    } label: {
                        HStack {
                            Text("\(book.name)")
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
        .navigationTitle("BookWorm")
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(book[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Book.self, inMemory: true)
}
