//
//  ContentView.swift
//  Bookeeping
//
//  Created by MSENSIS on 22/7/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State var textInput: String
    @State var books: [Items] = []
    var viewModel = ContentViewModel()
     
    var body: some View {
        NavigationView {
            VStack{
                    TextField("Search Book or Author...",
                              text: $textInput
                    )
                    .frame(width: 300,height: 30)
                    
                    .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    .multilineTextAlignment(.center)
                    .onTapGesture {
                        textInput = ""
                    }
                    .onSubmit() {
                        viewModel.getBooks(searchText: textInput) { response in
                            if let response = response{
                                books = response
                            }
                        }
                    }
                
                
                
                BooksCollectionView(books: $books, textInput: $textInput)
            }
        }
    }
}



#Preview {
    ContentView(textInput: "").environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
