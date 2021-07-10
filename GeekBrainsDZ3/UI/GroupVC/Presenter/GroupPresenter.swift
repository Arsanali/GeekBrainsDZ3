//
//  GroupPresenter.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 07.07.2021.
//

import Foundation

protocol GroupViewOutput: class {
    func getGroups()
    var groupModel: Groups? {get}
}

class GroupPresenter: GroupViewOutput {
    
    
    //MARK: - Properties
    weak var view: GroupViewInput?
    var groupModel: Groups?
    var networking: GetUsersService?

    //MARK: - init
    init(view:GroupViewInput ) {
        self.view = view
        networking = GetUsersServiceImp()
    }
    
    public func getGroups() {
        networking?.getGroups {[weak self] result in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.groupModel = value
                    self.view?.showData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
