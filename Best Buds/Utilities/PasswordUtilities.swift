//
//  PasswordUtilities.swift
//  Best Buds
//
//  Created by Ryan Pape on 6/18/20.
//  Copyright © 2020 Ryan Pape. All rights reserved.
//

import Foundation

class PasswordUtilities {
	
	 static func isPasswordValid(_ password : String) -> Bool {
		   
		   let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
		   return passwordTest.evaluate(with: password)
	   }
	
}
