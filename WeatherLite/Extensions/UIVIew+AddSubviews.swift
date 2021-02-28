//
//  UIVIew+AddSubviews.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 27.02.2021.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
