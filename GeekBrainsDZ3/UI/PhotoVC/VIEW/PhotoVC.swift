//
//  PhotoVC.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 28.06.2021.
//

import UIKit

protocol PhotoViewInput:class {
    func showData()
}

class PhotoVC: UIViewController {
    
    @IBOutlet weak var photoTableView: UITableView!
    
    var presenter: PhotoViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()

        settingTableView()
        settingPresenter()
    }
    
    private func settingTableView() {
        photoTableView.delegate = self
        photoTableView.dataSource = self
        photoTableView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    private func settingPresenter(){
        presenter = PhotoPresenter(view: self)
        presenter?.showImage()
    }

}


extension PhotoVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.model?.response?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = photoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PhotoCell ,
             let model = presenter?.model?.response?.items?[indexPath.row] else {return UITableViewCell()}
        cell.configureCell(with: model)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150 
    }
    
    
}
extension PhotoVC: PhotoViewInput {
    func showData() {
        DispatchQueue.main.async {
            self.photoTableView.reloadData()
        }
    }
}
