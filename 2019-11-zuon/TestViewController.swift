//
//  TestViewController.swift
//  2019-11-zuon
//
//  Created by hideyasu on 16/11/19.
//  Copyright © 2019 hideyasu. All rights reserved.
//

import UIKit

class TestViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var testButton: UIButton!
    
    @IBOutlet weak var backGround: UIView!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var searchTextField: MDTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testButton.makeShadow()
        testButton.makeCorner(cornerRadius: 3)
        searchTextField.delegate = self
  
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("text = \(textField.text)")
    }
}

extension UIView {
    
    func makeShadow2(shadowColor: UIColor? = .black, shadowOffset: CGSize = .zero, shadowRadius: CGFloat = 2.5, shadowOpacity: Float = 0.75){
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
    }
    func makeCorner(cornerRadius: CGFloat = 2.5){
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
    }
    
    
    
    
}




