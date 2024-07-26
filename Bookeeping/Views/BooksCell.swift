//
//  BooksCell.swift
//  Bookeeping
//
//  Created by MSENSIS on 22/7/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct BooksCell: View {
    @State var bookTitle: String
    @State var bookImage: String
    var body: some View {
        HStack{
            WebImage(url: URL(string: bookImage))
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text($bookTitle.wrappedValue)
        }
        .frame(width: 300)
    }
}

#Preview {
    BooksCell(bookTitle: "AAA", bookImage: "AAA")
}

