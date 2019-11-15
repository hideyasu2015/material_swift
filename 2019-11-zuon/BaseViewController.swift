//
//  BaseViewController.swift
//  2019-11-zuon
//
//  Created by hideyasu on 15/11/19.
//  Copyright © 2019 hideyasu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var navigationView: UIView?
    @IBOutlet weak var navigationHeight: NSLayoutConstraint?
    @IBOutlet weak var navigationTitleLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationView()
    }
    
    private func configNavigationView() {
        navigationHeight?.constant = kNavigationBarHeight
        navigationView?.backgroundColor = kMainTintColor
        navigationView?.makeShadow()
        navigationTitleLabel?.textColor = kNavigationTintColor
        navigationTitleLabel?.font = kNavigationTitleFont
//        navigationView?.subviews.forEach({ (view) in
//            view.tintColor = kNavigationTintColor
//        })
        navigationView?.subviews.filter({ (view) -> Bool in
            view is UIButton
        }).forEach({ (view) in
            view.tintColor = kNavigationTintColor
        })
    }
}

