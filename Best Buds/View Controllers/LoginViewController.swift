//
//  LoginViewController.swift
//  Best Buds
//
//  Created by Ryan Pape on 6/17/20.
//  Copyright © 2020 Ryan Pape. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
	
	@IBOutlet weak var emailTextField: UITextField!
	
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var submitButton: UIButton!
	
	@IBOutlet weak var errorMessage: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		setUpElements()
    }
    
	func setUpElements(){
		errorMessage.alpha = 0
		Utilities.textFieldSylization(emailTextField)
		Utilities.textFieldSylization(passwordTextField)
		Utilities.styleFilledButton(submitButton)

	}

	func validateUserInfo() -> String? {
		if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
			return "Please be sure to fill in all fields."
		}
		return nil
	}
	
	func displayErrorMessage(_ message:String){
		//display the error message
		errorMessage.text = message
		errorMessage.alpha = 1
	}
	
	func homeScreenTransition() {
		let homeViewController = storyboard?.instantiateViewController(identifier: "HomeVC")
		view.window?.rootViewController = homeViewController
		view.window?.makeKeyAndVisible()
	}
	
	@IBAction func submitButtonAction(_ sender: Any) {
		if validateUserInfo() != nil {
			Utilities.styleError(errorMessage)
			errorMessage.alpha = 1
			displayErrorMessage(validateUserInfo()!)
		}
		else {
			let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
				if error != nil {
					self.errorMessage.text = "Please check email and password and try again."
				}
				else {
					self.homeScreenTransition()
				}
			}
		}
	}
}
