//
//  ReusableView.swift
//  Cartoons2D
//
//  Created by Amr Hassan on 28/11/2022.
//

import Foundation

protocol ReusableView: AnyObject {}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
