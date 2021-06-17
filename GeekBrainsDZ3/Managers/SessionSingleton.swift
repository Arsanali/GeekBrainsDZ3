//
//  SessionSingleton.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 17.06.2021.
//

import Foundation

class SessionSingleton {
    
    static var shared = SessionSingleton()
    
    var token: String = "user token"
    var userId: Int = 3233242341
    
    private init() {}
    
}
