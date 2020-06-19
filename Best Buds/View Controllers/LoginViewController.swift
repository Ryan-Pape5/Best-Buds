//
//  LoginViewController.swift
//  Best Buds
//
//  Created by Ryan Pape on 6/17/20.
//  Copyright © 2020 Ryan Pape. All rights reserved.
//

import UIKit

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

	
	@IBAction func submitButtonAction(_ sender: Any) {
	}
}
