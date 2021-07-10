//
//  PhotoCell.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 09.07.2021.
//

import UIKit
import SDWebImage

class PhotoCell: UITableViewCell {
    
    
    @IBOutlet weak var PhotoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(with model: ItemPhotos) {
        guard let imageUrl = URL(string: model.photo1280 ?? "") else {return}
        PhotoImage.sd_setImage(with:imageUrl , completed: nil)
    }
    
}
