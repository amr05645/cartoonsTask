//
//  HomeTableViewCell.swift
//  Cartoons2D
//
//  Created by Amr Hassan on 28/11/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell, ReusableView {
    
    @IBOutlet weak var cartonImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(data: HomeModel?) {
        titleLabel.layer.cornerRadius = 5
        cartonImage.layer.cornerRadius = 10
        if data?.title == "string" {
            titleLabel.isHidden = true
        } else {
            titleLabel.isHidden = false
        }
        titleLabel.text = data?.title ?? ""
        cartonImage.showImage(url: data?.image ?? "", cornerRadius: 10)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
