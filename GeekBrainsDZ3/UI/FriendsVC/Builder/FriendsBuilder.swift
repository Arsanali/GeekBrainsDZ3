//
//  FriendsBuilder.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 29.06.2021.
//

import Foundation
import UIKit

final class FriendsBuilder {
    
    static func configureScreenFriendsVC() -> UIViewController {
        
        let view = FriendsVC()
        let presenter = FriendsPresenterImp(view: view)
        let networking = GetUsersServiceImp()
        
        view.presenter = presenter
        presenter.view = view
        presenter.networking = networking
        
        return view
    }
    
}
