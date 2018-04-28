//
//  BuyDetailsViewController.swift
//  textbooked
//
//  Created by Jordan Woods on 3/23/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

import UIKit
import Firebase

class BuyDetailsViewController: UIViewController {
    var textbookTitlePassed : String?
    var textbookAuthorPassed : String?
    var textbookConditionPassed : String?
    var sellerNamePassed : String?
    var textbookPricePassed : String?
    var textbookImagePassed : UIImage?
    
    @IBOutlet weak var textbookImage: UIImageView!
    @IBOutlet weak var textbookTitle: UILabel!
    @IBOutlet weak var textbookAuthor: UILabel!
    @IBOutlet weak var textbookCondition: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var textbookPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textbookTitle.text = textbookTitlePassed
        textbookAuthor.text = textbookAuthorPassed
        textbookCondition.text = textbookConditionPassed
        textbookPrice.text = textbookPricePassed
        sellerName.text = sellerNamePassed
        
        let imageRef = Storage.storage().reference().child("textbook_image").child(textbookTitlePassed!)
        
        imageRef.getData(maxSize: 1 * 1024 * 1024, completion: { (data, error) in
            if let error = error {
                print(error)
            } else {
                print("HAPPENING NOW")
                self.textbookImage.image = UIImage(data: data!)!
            }
        })
        
        textbookImage.contentMode = .scaleAspectFit
        textbookImage.image = textbookImagePassed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func purchasePressed(_ sender: UIButton) {
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
