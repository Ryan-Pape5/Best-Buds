//
//  SignUpViewController.swift
//  Best Buds
//
//  Created by Ryan Pape on 6/17/20.
//  Copyright © 2020 Ryan Pape. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

	@IBOutlet weak var firstNameTextField: UITextField!
	
	@IBOutlet weak var lastNameTextField: UITextField!
	
	@IBOutlet weak var emailTextField: UITextField!
	
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var passwordReentryTextField: UITextField!
	
	@IBOutlet weak var signUpButton: UIButton!
	
	@IBOutlet weak var errorMessage: UILabel!
	
	@IBOutlet weak var usernameTextField: UITextField!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		setUpElements()
    }
    
	func setUpElements(){
		errorMessage.alpha = 0
		Utilities.textFieldSylization(firstNameTextField)
		Utilities.textFieldSylization(lastNameTextField)
		Utilities.textFieldSylization(emailTextField)
		Utilities.textFieldSylization(passwordTextField)
		Utilities.textFieldSylization(passwordReentryTextField)
		Utilities.textFieldSylization(usernameTextField)
		Utilities.styleFilledButton(signUpButton)
	}
    
	func validateUserInfo() -> String? {
		//validate that all forms are filled in
		if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			passwordReentryTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
			return "Please be sure to fill in all fields."
		}
		//validate both password fields match
		if passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) != passwordReentryTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines){
			return "Passwords do not match."
		}
		//validate password fits requirments
		let pword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		if ValidationUtilities.isPasswordValid(pword) == false {
			return """
			Plese make sure your password includes:
			A minimum of eight characters
			At least one uppercase letter
			At least one lowercase letter
			At least one number
			At least one special character.
			"""
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
	
	
	@IBAction func submitPressed(_ sender: Any) {
		if validateUserInfo() != nil {
			Utilities.styleError(errorMessage)
			errorMessage.alpha = 1
			displayErrorMessage(validateUserInfo()!)
		}
		else {
			let firstname = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let lastname = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
				if err != nil {
					self.displayErrorMessage("Error creating user")
				}
				else {
					let db = Firestore.firestore()
					db.collection("users").addDocument(data: ["firstname" : firstname, "lastname" : lastname, "username" : username, "uid" : result!.user.uid]) { (error) in
						if error != nil {
							self.displayErrorMessage("Error saving user data")
						}
					}
					self.homeScreenTransition()
				}
			}
		}
	}
	
}
