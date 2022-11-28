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
    
    func configure() {
        cartonImage.layer.cornerRadius = 10
        titleLabel.layer.cornerRadius = 5
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
