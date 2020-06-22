//
//  Utilities.swift
//  customauth
//
//  Created by Ryan Pape on 6/18/20.
//  Copyright © 2020 Ryan Pape. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func textFieldSylization(_ textfield:UITextField) {
        // Remove border on text field
		textfield.borderStyle = .roundedRect
		textfield.tintColor = UIColor.white
		textfield.layer.borderColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
		textfield.layer.borderWidth = 1.25
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.white
    }
	
	static func styleError(_ label:UILabel) {
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
	}
    
}
