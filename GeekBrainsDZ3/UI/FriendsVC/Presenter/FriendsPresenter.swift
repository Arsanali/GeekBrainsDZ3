//
//  FriendsPresenter.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 28.06.2021.
//

import Foundation

protocol FriendsPresenter: class {
    func getFriends()
    var model: Friends? {get set}
}

class FriendsPresenterImp: FriendsPresenter {
    
    var networking: GetUsersService?
    var model: Friends?
    weak var view: FriendsViewProtocol?
    
    init(view:FriendsViewProtocol) {
        self.view = view
        networking = GetUsersServiceImp()
    }
    
    func getFriends() {
        networking?.getUsers { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.model = value
                    self.view?.reloadData()
                    print("Данные пришли")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
