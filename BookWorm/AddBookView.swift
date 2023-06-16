//
//  AddBookView.swift
//  BookWorm
//
//  Created by Hamza Osama on 14/06/2023.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var book: [Book]
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var author = ""
    @State private var language = "English"
    @State private var count = 1
    @State private var thoughts = ""
    @State private var rating = 3
    @State private var date = Date.now
    let currentDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Name", text: $name)
                        TextField("Author's name", text: $author)
                        TextField("Language", text: $language)
                        
                        DatePicker(
                            "Start Date",
                            selection: $date,
                            in: ...currentDate,
                            displayedComponents: .date
                        )
                        
                        Stepper("I have read this book \(count) time", value: $count, in: 1...9, step: 1)
                    }
                    Section {
                        RatingView(rating: $rating)
                            .font(.title)
                        TextField("Write your thoughts",text: $thoughts)
                    } header: {
                        Text("Write a review")
                    }
                }
                
                Button{
                    let newBook = Book(name: name, author: author, language: language, count: count, thoughts: thoughts, rating: Int16(rating), date: date)
                    
                    modelContext.insert(object: newBook)
                    dismiss()
                } label: {
                    Rectangle()
                        .frame(width: 275, height: 75)
                        .cornerRadius(7.5)
                        .foregroundColor(bookIsValid ? Color.blue : Color.gray)
                        .overlay(
                            Text("Save")
                                .foregroundColor(.primary)
                        )
                }
                .disabled(bookIsValid == false)
                .padding()
                .navigationTitle("Add Book")

            }
        }
    }
    
    var bookIsValid: Bool {
        if name.isEmpty {
            return false
        } else {
            return true
        }
    }
}

#Preview {
    AddBookView()
        .modelContainer(for: Book.self, inMemory: true)
}
