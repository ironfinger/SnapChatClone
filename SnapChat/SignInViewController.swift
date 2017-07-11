//
//  ViewController.swift
//  SnapChat
//
//  Created by Thomas Houghton on 10/07/2017.
//  Copyright © 2017 Thomas Houghton. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func turnUpTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("Hey we have an error:  \(error)")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("We have an error \(error)")
                    }else{
                        print("User was created successfully")
                    }
                })
            }else{
                print("sign in successful")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
                
            }
        }
    }
}

