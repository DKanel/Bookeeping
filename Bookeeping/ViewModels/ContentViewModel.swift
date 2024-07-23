//
//  ContentsViewModel.swift
//  Bookeeping
//
//  Created by MSENSIS on 22/7/24.
//

import Foundation

class ContentViewModel: ObservableObject{
    let dataManager = DataManager()
    let apiKey = Constants().api_key
    @Published var books: [Items] = []
    
    func getBooks(searchText: String, completion: @escaping ([Items]?) -> Void){
        dataManager.fetchBooks(query: searchText, apiKey: apiKey) { [self] response in
            if let response = response{
                books = response
                completion(response)
            }
           
        }
    }
}
