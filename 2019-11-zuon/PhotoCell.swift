//
//  PhotoCell.swift
//  2019-11-zuon
//
//  Created by hideyasu on 15/11/19.
//  Copyright © 2019 hideyasu. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    static let kIdentifier = "PhotoCell"
    
    @IBOutlet weak var photoNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.makeShadow()
        containerView.makeCorner(cornerRadius: 8)
    }
    
    func bind(text: String?) {
        photoNameLabel.text = text
    }
}
