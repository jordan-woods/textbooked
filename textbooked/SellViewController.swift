//
//  SellViewController.swift
//  textbooked
//
//  Created by Jordan Woods on 3/17/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

import UIKit

class SellViewController: UIViewController {
    @IBOutlet weak var textbookTitle: UITextField!
    @IBOutlet weak var textbookISBN: UITextField!
    @IBOutlet weak var textbookAuthor: UITextField!
    @IBOutlet weak var textbookEdition: UITextField!
    @IBOutlet weak var textbookQuality: UISegmentedControl!
    @IBOutlet weak var textbookPrice: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postPressed(_ sender: UIButton) {
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
