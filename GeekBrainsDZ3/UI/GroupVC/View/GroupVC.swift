//
//  GroupVC.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 28.06.2021.
//

import UIKit

protocol GroupViewInput:class {
    func showData()
}

class GroupVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: GroupViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView()
        settingPresenter()
    }
    
    private func settingTableView(){
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "GroupCell")
    }
    
    private func settingPresenter(){
        presenter = GroupPresenter(view: self)
        presenter?.getGroups()
       
    }
}

    //MARK: - TableVIew methods
extension GroupVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.groupModel?.response.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell , let model = presenter?.groupModel?.response.items[indexPath.row] else {return UITableViewCell()}
        cell.configureCell(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

    //MARK: - View Protocol
extension GroupVC: GroupViewInput {
    func showData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
