//
//  Textbook.swift
//  textbooked
//
//  Created by Jordan Woods on 3/19/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

class Textbook {
    enum Condition {
        case perfect, veryGood, good, poor
    }
    
    var title : String
    var author : String
    var sellerName : String
    var price : Double
    var condition : String
    
    init(bookTitle: String, bookAuthor: String, name: String, bookPrice: Double, bookCondition: String, imageLink: String) {
        title = bookTitle
        author = bookAuthor
        sellerName = name
        price = bookPrice
        condition = bookCondition
    }
}
