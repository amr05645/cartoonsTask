//
//  UIImageView+Extension.swift
//  Cartoons2D
//
//  Created by Amr Hassan on 28/11/2022.
//

import UIKit
import Kingfisher

enum Mode {
    case dark
    case light
}

extension UIImageView {
    
    func showImage(url: String?, cornerRadius: CGFloat) {
        guard let url = url else {return}
        guard let imageUrl = URL(string: url) else {return}
        self.kf.setImage(with: imageUrl)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
        |> RoundCornerImageProcessor(cornerRadius: cornerRadius)
        self.kf.indicatorType = .activity
        
        self.kf.setImage(
            with: imageUrl,
            placeholder: UIImage(named: "placeholder_light"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
}
