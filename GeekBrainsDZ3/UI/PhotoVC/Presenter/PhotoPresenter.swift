//
//  PhotoPresenter.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 09.07.2021.
//

import Foundation

protocol PhotoViewOutput: class {
    func showImage()
    var model: Photos? {get}
}

class PhotoPresenter: PhotoViewOutput {
    
    var view : PhotoViewInput?
    var model: Photos?
    var networking: GetUsersService?
    
    init(view: PhotoViewInput) {
        self.view = view
        networking = GetUsersServiceImp()
    }
    
    func showImage() {
        networking?.getPhotos { [weak self ] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.model = value
                    self.view?.showData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
