//
//  ViewController.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 17.06.2021.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    let serviceUser = GetUsersServiceImp()
    
    @IBOutlet weak var tokenLabel: UILabel!
    
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = SessionSingleton.shared
        
        tokenLabel.text = session.token
        userIdLabel.text = String(session.userId)
        session.userId = 20

        //MARK: - Сервис для получения списка друзей
        serviceUser.getUsers {  (users) in
            print(users)
        }
        //MARK: - Сервис для получения списка групп пользователя
        serviceUser.getGroups { (groups) in
                print(groups)
            }
        
        //MARK: - Сервис для получения фотографий пользователя
        
        serviceUser.getPhotos { (photos) in
            print(photos)
        }
    }
}

