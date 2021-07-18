//
//  FriendsVC.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 28.06.2021.
//

import UIKit
import RealmSwift


protocol FriendsViewProtocol: class {
    func reloadData()
}

class FriendsVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: FriendsPresenter?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configurePresenter()
        configureTableView()
    }
    
   private func configurePresenter(){
        presenter = FriendsPresenterImp(view: self)
        presenter?.getFriends()
       // presenter?.fetchDataRealm()  
    }
    
    private func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "FriendsCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

//MARK: - TableView methods
extension FriendsVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.model?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendsCell
        let model = presenter?.model?[indexPath.row] 
        cell.configureCell(with: model!) 
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

//MARK: - FriendsView Protocol 
extension FriendsVC: FriendsViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
