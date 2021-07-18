//
//  FriendsPresenter.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 28.06.2021.
//

import Foundation
import RealmSwift


protocol FriendsPresenter: class {
    func getFriends()
    var model: [Friends]?{get set}
    var db: DatabaseService? {get set}
}

class FriendsPresenterImp: FriendsPresenter {

    
    var networking  : GetUsersService?
    var model  : [Friends]?
    weak var view   : FriendsViewProtocol?
    var db: DatabaseService?
    let realm = try! Realm()
    
    init(view:FriendsViewProtocol) {
        self.view   = view
        networking  = GetUsersServiceImp()
        db = RealmService()
    }
    
    func getFriends() {
        let userID = SessionSingleton.shared.userId
        let token = SessionSingleton.shared.token
        
        networking?.getUsers(params: FriendsRequest(userId: userID, count: 100, token: token)) {[weak self] result in
            
            guard let self = self else {return}
            
            DispatchQueue.main.async {  
                switch result {
                case .success(let users):
                    self.model = users
                    self.view?.reloadData()
                    do {
                        try self.db?.saveUser(user: self.model!)
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
