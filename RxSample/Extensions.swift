//
//  Extensions.swift
//  RxFirst
//
//  Created by Poler Bear on 2017/10/04.
//  Copyright © 2017年 Poler Bear. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addConstraints(withFormat format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }

    func setTranslatesAutoresizingMaskIntoConstraintsToFalse() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}



extension UITextField {
    static func defaultStyle() -> UITextField {
        
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .left
        return textField
    }
    
}
