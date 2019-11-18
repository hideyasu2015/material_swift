//
//  MDTextField.swift
//  2019-11-zuon
//
//  Created by hideyasu on 18/11/19.
//  Copyright © 2019 hideyasu. All rights reserved.
//

import UIKit

enum MDTextFieldStyle {
    case BOTTOM_BAR
    case ROUNDED_BORDER
}

class MDTextField: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var borderView: UIView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var placeholderLabel: UILabel!
    @IBOutlet var placeholderLabelTopLayout: NSLayoutConstraint!
    
    var delegate: UITextFieldDelegate? = nil
    
    var type: MDTextFieldStyle = .BOTTOM_BAR {
        didSet {
            if type == .ROUNDED_BORDER {
                addBorderTextField()
            } else {
                removeBorderTextField()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    
    private func initSubViews() {
        Bundle.main.loadNibNamed("MDTextField", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        textField.delegate = self
        borderView.bringSubviewToFront(placeholderLabel)
        type = .ROUNDED_BORDER
    }
    
    func addBorderTextField() {
        borderView.layer.borderColor = UIColor.gray.cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = 4
        placeholderLabel.textColor = UIColor.gray
        placeholderLabel.backgroundColor = .white
    }
    
    func removeBorderTextField() {
        borderView.layer.borderColor = UIColor.clear.cgColor
        borderView.layer.borderWidth = 0
        borderView.layer.cornerRadius = 0
        placeholderLabel.textColor = UIColor.gray
        placeholderLabel.backgroundColor = .white
    }
    
    private func movePlaceholderToTop() {
        placeholderLabel.isHidden = false
        UIView.animate(withDuration: 0.3, animations: { [unowned self] in
            self.placeholderLabelTopLayout.constant = 0
            self.contentView.layoutIfNeeded()
        }) { [unowned self] (completed) in
            self.borderView.layer.borderColor = UIColor.systemIndigo.cgColor
            self.placeholderLabel.textColor = UIColor.systemIndigo
        }
    }
    
    private func movePlaceholderToCenter() {
       placeholderLabel.isHidden = textField.text != nil
        UIView.animate(withDuration: 0.3, animations: { [unowned self] in
            self.placeholderLabelTopLayout.constant = 20
            self.contentView.layoutIfNeeded()
        }) { [unowned self] (completed) in
            self.borderView.layer.borderColor = UIColor.gray.cgColor
            self.placeholderLabel.textColor = UIColor.gray
        }
    }
    
}

extension MDTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        movePlaceholderToTop()
        delegate?.textFieldDidBeginEditing?(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        movePlaceholderToCenter()
        delegate?.textFieldDidEndEditing?(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.textFieldShouldReturn?(textField)
        return true
    }
    
}
