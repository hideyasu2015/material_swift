//
//  ButtonExtensions.swift
//  2019-11-zuon
//
//  Created by hideyasu on 15/11/19.
//  Copyright © 2019 hideyasu. All rights reserved.
//

import UIKit

extension UIView {
    
    func makeShadow(showdowColor: UIColor? = .black, shadowRadius: CGFloat = 2.5, shadowOffset: CGSize = .zero, shadowOpacity: Float = 0.5) {
        layer.shadowColor = showdowColor?.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
    }
    
   
    
}
