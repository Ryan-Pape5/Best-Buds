//
//  SignUpViewController.swift
//  Best Buds
//
//  Created by Ryan Pape on 6/17/20.
//  Copyright © 2020 Ryan Pape. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

	@IBOutlet weak var firstNameTextField: UITextField!
	
	@IBOutlet weak var lastNameTextField: UITextField!
	
	@IBOutlet weak var emailTextField: UITextField!
	
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var passwordReentryTextField: UITextField!
	
	@IBOutlet weak var signUpButton: UIButton!
	
	@IBOutlet weak var errorMessage: UILabel!
	
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
		Utilities.styleFilledButton(signUpButton)
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
	
	@IBAction func submitPressed(_ sender: Any) {
	}
	
}
