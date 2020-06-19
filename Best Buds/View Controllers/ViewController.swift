//
//  ViewController.swift
//  Best Buds
//
//  Created by Ryan Pape on 6/14/20.
//  Copyright © 2020 Ryan Pape. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	

	@IBOutlet weak var signUpButton: UIButton!
	
	
	@IBOutlet weak var loginButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		setUpElements()
	}

	func setUpElements() {
		Utilities.styleHollowButton(signUpButton)
		Utilities.styleHollowButton(loginButton)
	}
}

