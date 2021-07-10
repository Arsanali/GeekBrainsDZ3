//
//  GroupCell.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 07.07.2021.
//

import UIKit
import SDWebImage

class GroupCell: UITableViewCell {
    
    //MARK: - IBoutlets
    
    @IBOutlet weak var groupImage: UIImageView!
    
    @IBOutlet weak var nameGroup: UILabel!
    
    @IBOutlet weak var descriptionGroupLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        groupImage.layer.cornerRadius = groupImage.frame.width / 2
    }

    
    open func configureCell(with model: ItemGroup) {
        
        guard let url = URL(string: model.photo100 ?? "") else {return}
        nameGroup.text = model.name
        descriptionGroupLabel.text = model.screenName
        groupImage.sd_setImage(with: url, completed: nil)
        
    }
    
}
