//
//  ViewController.swift
//  textbooked
//
//  Created by Jordan Woods on 2/19/18.
//  Copyright © 2018 Jordan Woods. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

