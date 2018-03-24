//
//  SellViewController.swift
//  textbooked
//
//  Created by Jordan Woods on 3/17/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

import UIKit
import Firebase

class SellViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var textbookTitle: UITextField!
    @IBOutlet weak var textbookISBN: UITextField!
    @IBOutlet weak var textbookAuthor: UITextField!
    @IBOutlet weak var textbookEdition: UITextField!
    @IBOutlet weak var textbookQuality: UISegmentedControl!
    @IBOutlet weak var textbookPrice: UITextField!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var imageUpload: UIImageView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postPressed(_ sender: UIButton) {
        textbookTitle.isEnabled = false
        textbookISBN.isEnabled = false
        textbookAuthor.isEnabled = false
        textbookEdition.isEnabled = false
        textbookQuality.isEnabled = false
        textbookPrice.isEnabled = false
        postButton.isEnabled = false
        
        let textbookDB = Database.database().reference().child("Textbooks")
        let textbookDictionary = ["Poster": Auth.auth().currentUser?.email,
                                  "TextbookTitle": textbookTitle.text!,
                                  "TextbookISBN": textbookISBN.text!,
                                  "TextbookAuthor": textbookAuthor.text!,
                                  "TextbookEdition": textbookEdition.text!,
                                  "TextbookQuality": textbookQuality.titleForSegment(at: textbookQuality.selectedSegmentIndex),
                                  "TextbookPrice": textbookPrice.text!]
        
        textbookDB.childByAutoId().setValue(textbookDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Textbook successfully saved!")
                
                self.textbookTitle.isEnabled = true
                self.textbookISBN.isEnabled = true
                self.textbookAuthor.isEnabled = true
                self.textbookEdition.isEnabled = true
                self.textbookQuality.isEnabled = true
                self.textbookPrice.isEnabled = true
                self.postButton.isEnabled = true
                
                self.textbookTitle.text = ""
                self.textbookISBN.text = ""
                self.textbookAuthor.text = ""
                self.textbookEdition.text = ""
                self.textbookPrice.text = ""
            }
        }
    }
    
    @IBAction func uploadPhotoPressed(_ sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageUpload.contentMode = .scaleAspectFit
        imageUpload.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
