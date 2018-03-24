//
//  Textbook.swift
//  textbooked
//
//  Created by Jordan Woods on 3/19/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

class Textbook {
    
    var title : String
    var author : String
    var sellerName : String
    var price : String
    var condition : String
    var isbn : String
    var edition : String
    
    init(bookTitle: String, bookAuthor: String, bookISBN: String, bookEdition: String, name: String, bookPrice: String, bookCondition: String) {
        title = bookTitle
        author = bookAuthor
        isbn = bookISBN
        sellerName = name
        price = bookPrice
        condition = bookCondition
        edition = bookEdition
    }
}
