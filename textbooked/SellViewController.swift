//
//  SellViewController.swift
//  textbooked
//
//  Created by Jordan Woods on 3/17/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class SellViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    @IBOutlet weak var textbookTitle: UITextField!
    @IBOutlet weak var textbookISBN: UITextField!
    @IBOutlet weak var textbookAuthor: UITextField!
    @IBOutlet weak var textbookEdition: UITextField!
    @IBOutlet weak var textbookQuality: UISegmentedControl!
    @IBOutlet weak var textbookPrice: UITextField!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var imageUpload: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let picker = UIImagePickerController()
    var selectedTextbookPhoto = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        picker.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
        view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func didTapView(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == textbookPrice) {
            scrollView.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
//    func addObservers() {
//        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: nil) { (notification) in
//            self.keyboardWillShow(notification: notification)
//        }
//
//        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: nil) { (notification) in
//            self.keyboardWillHide(notification: notification)
//        }
//    }
//
//    func keyboardWillShow(notification: Notification) {
//        guard let userInfo = notification.userInfo,
//            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//                return
//        }
//
//        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
//
//    }
    
    @IBAction func postPressed(_ sender: UIButton) {
        textbookTitle.isEnabled = false
        textbookISBN.isEnabled = false
        textbookAuthor.isEnabled = false
        textbookEdition.isEnabled = false
        textbookQuality.isEnabled = false
        textbookPrice.isEnabled = false
        postButton.isEnabled = false
        
        let storageRef = Storage.storage().reference(forURL: "gs://textbooked-219f7.appspot.com").child("textbook_image").child(textbookTitle.text!)
        
        if let imgUpload = self.selectedTextbookPhoto as? UIImage, let imageData = UIImageJPEGRepresentation(imgUpload, 0.1) {
            storageRef.putData(imageData, metadata: nil) { (metadata, error) in
                if error != nil {
                    return
                }
                
                let textbookImageURL = metadata?.downloadURL()?.absoluteString
                let textbookDB = Database.database().reference().child("Textbooks")
                // let imageDB = Storage.storage().reference().child("Images")
                let textbookDictionary = ["Poster": Auth.auth().currentUser?.email,
                                          "TextbookTitle": self.textbookTitle.text!,
                                          "TextbookISBN": self.textbookISBN.text!,
                                          "TextbookAuthor": self.textbookAuthor.text!,
                                          "TextbookEdition": self.textbookEdition.text!,
                                          "TextbookQuality": self.textbookQuality.titleForSegment(at: self.textbookQuality.selectedSegmentIndex),
                                          "TextbookPrice": self.textbookPrice.text!,
                                          "TextbookPhoto": textbookImageURL,
                                          "TextbookPurchased": "false"]
                
                textbookDB.child(self.textbookISBN.text!).setValue(textbookDictionary) {
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
        }
        
        // imageDB.setValue(imageUpload.image.)
    }
    
    @IBAction func uploadPhotoPressed(_ sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        selectedTextbookPhoto = chosenImage
        imageUpload.contentMode = .scaleAspectFit
        imageUpload.image = chosenImage
        dismiss(animated:true, completion: nil)
        uploadButton?.removeFromSuperview()
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
