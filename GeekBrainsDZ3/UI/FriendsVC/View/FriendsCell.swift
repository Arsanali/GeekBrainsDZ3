//
//  FriendsCell.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 28.06.2021.
//

import UIKit
import SDWebImage

class FriendsCell: UITableViewCell {
    
   //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    
   //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageUser.alpha = 0.1
        UIView.animate(withDuration: 1.0) {
            self.imageUser.alpha = 1
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageUser.layer.cornerRadius = imageUser.frame.width / 2
        imageUser.layer.shadowOffset = CGSize(width: -10, height: -20)
        imageUser.layer.shadowRadius = 10
        imageUser.layer.shadowOpacity = 0.5
        imageUser.layer.shadowColor = UIColor(.black).cgColor
        
    }
    
    //MARK: - Конфигруция ячейки
    public func configureCell(with model: Friends){
        nameLabel.text = model.firstName
        surnameLabel.text = model.lastName
        imageUser.sd_setImage(with: URL(string: model.photoString ), completed: nil)
    }
}
