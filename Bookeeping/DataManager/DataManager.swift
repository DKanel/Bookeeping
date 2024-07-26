//
//  DataManager.swift
//  Bookeeping
//
//  Created by MSENSIS on 22/7/24.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire


class DataManager{
    
    func fetchBooks(query: String, apiKey: String, completion: @escaping ([Items]?) -> Void) {
        let url = "https://www.googleapis.com/books/v1/volumes"
        let parameters: Parameters = ["q": query,
                                      "apiKey": apiKey]
        
        
        AF.request(url, parameters: parameters).responseDecodable(of: Books.self) { response in
            switch response.result {
            case .success(let value):
                var books = [Items]()
                for item in value.items {
                    let kind = item.kind
                    let id = item.id
                    let etag = item.etag
                    let selfLink = item.selfLink
                    let volumeInfo = item.volumeInfo
                    let salesInfo = item.saleInfo
                    let accessInfo = item.accessInfo
                    
                    let book = Items(kind: kind, id: id, etag: etag, selfLink: selfLink, volumeInfo: volumeInfo, saleInfo: salesInfo, accessInfo:accessInfo )
                    books.append(book)
                }
                completion(books)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}
