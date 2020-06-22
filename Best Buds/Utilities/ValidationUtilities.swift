//
//  PasswordUtilities.swift
//  Best Buds
//
//  Created by Ryan Pape on 6/18/20.
//  Copyright © 2020 Ryan Pape. All rights reserved.
//

import Foundation

class ValidationUtilities {
	
	 static func isPasswordValid(_ password:String) -> Bool {
		   
		   let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
		   return passwordTest.evaluate(with: password)
	   }
	
}
