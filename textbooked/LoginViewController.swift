//
//  ViewController.swift
//  textbooked
//
//  Created by Jordan Woods on 2/19/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordHeightConstraint: NSLayoutConstraint!
    @IBOutlet var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        usernameField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pageTapped))
        background.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        emailHeightConstraint.constant = 288
        view.layoutIfNeeded()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    @objc func pageTapped() {
        usernameField.endEditing(true)
        passwordField.endEditing(true)
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: usernameField.text!, password: passwordField.text!) { (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                print("Login successful!")
                self.performSegue(withIdentifier: "goToBuySell", sender: self)
            }
        }
    }
    
}

