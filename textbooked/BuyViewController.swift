//
//  BuyViewController.swift
//  textbooked
//
//  Created by Jordan Woods on 3/17/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

import UIKit
import Firebase

class BuyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var textbookArray : [Textbook] = [Textbook]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var textbookTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textbookTableView.isUserInteractionEnabled = true
        self.view.backgroundColor = UIColor.white
        
        textbookTableView.delegate = self
        textbookTableView.dataSource = self
        
        textbookTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customTableViewCell")
        
        configureTableView()
        retrieveTextbooks()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! CustomTableViewCell
        
        cell.textbookTitle.text = textbookArray[indexPath.row].title
        cell.textbookAuthor.text = textbookArray[indexPath.row].author
        cell.textbookCondition.text = textbookArray[indexPath.row].condition
        cell.sellPrice.text = textbookArray[indexPath.row].price
        cell.sellerName.text = textbookArray[indexPath.row].sellerName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textbookArray.count
    }
    
    func configureTableView() {
        textbookTableView.rowHeight = UITableViewAutomaticDimension
        textbookTableView.estimatedRowHeight = 180.0
    }
    
    func retrieveTextbooks() {
        let textbookDB = Database.database().reference().child("Textbooks")
        textbookDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            let isbn = snapshotValue["TextbookISBN"]!
            let title = snapshotValue["TextbookTitle"]!
            let author = snapshotValue["TextbookAuthor"]!
            let edition = snapshotValue["TextbookEdition"]!
            let poster = snapshotValue["Poster"]!
            let quality = snapshotValue["TextbookQuality"]!
            let price = snapshotValue["TextbookPrice"]!
            
            let textbook = Textbook(bookTitle: title, bookAuthor: author, bookISBN: isbn, bookEdition: edition, name: poster, bookPrice: price, bookCondition: quality)
            
            self.textbookArray.append(textbook)
            self.configureTableView()
            self.textbookTableView.reloadData()
        }
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
