//
//  Textbook.swift
//  textbooked
//
//  Created by Jordan Woods on 3/19/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

import UIKit

class Textbook {
    
    var title : String
    var author : String
    var sellerName : String
    var price : String
    var condition : String
    var isbn : String
    var edition : String
    var sold : String
    // var photo : UIImage
    
    init(bookTitle: String, bookAuthor: String, bookISBN: String, bookEdition: String, name: String, bookPrice: String, bookCondition: String, soldStatus: String) {
        title = bookTitle
        author = bookAuthor
        isbn = bookISBN
        sellerName = name
        price = bookPrice
        condition = bookCondition
        edition = bookEdition
        sold = soldStatus
        // photo = bookImage
    }
}
