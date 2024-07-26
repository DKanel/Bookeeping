//
//  BooksCollectionView.swift
//  Bookeeping
//
//  Created by MSENSIS on 22/7/24.
//

import SwiftUI

struct BooksCollectionView: View {
    @Binding var books: [Items]
    @Binding var textInput: String
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))], content: {
                ForEach(books){ book in
                    if let bookImage = book.volumeInfo.imageLinks?.smallThumbnail , let title = book.volumeInfo.title{
                        BooksCell(bookTitle: title, bookImage: bookImage)
                    }
                    if book.volumeInfo.imageLinks?.smallThumbnail == nil{
                        BooksCell(bookTitle: book.volumeInfo.title!, bookImage: "https://placehold.co/600x400")
                    }
                    Spacer(minLength: 20)
                    
                }
            })
        }
    }
}

#Preview {
    struct Preview: View {
           @State var books = []
           var body: some View {
               BooksCollectionView(books: .constant([]), textInput: .constant("AAA"))
           }
       }

       return Preview()
   }
