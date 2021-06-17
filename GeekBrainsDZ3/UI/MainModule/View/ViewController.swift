//
//  ViewController.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 17.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tokenLabel: UILabel!
    
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = SessionSingleton.shared
        
        tokenLabel.text = session.token
        userIdLabel.text = String(session.userId)
        session.userId = 20 
        
        print()
    }
}

