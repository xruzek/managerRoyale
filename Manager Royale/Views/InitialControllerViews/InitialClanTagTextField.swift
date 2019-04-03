//
//  initialClanTagTextField.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/29/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//
import UIKit

class clanTagTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTextField() {
        borderStyle           = .none
        layer.cornerRadius    = 10
        tintColor             = Colors.seanDarkGrey
        textColor             = Colors.seanDarkGrey
        font                  = UIFont(name: Fonts.avenirNextMedium, size: 16)
        backgroundColor       = UIColor.white.withAlphaComponent(0.7)
        autocorrectionType    = .no
        clipsToBounds         = true
        
        let placeholder       = self.placeholder != nil ? self.placeholder! : "#000000000000"
        
        let placeholderFont   = UIFont(name: Fonts.avenirNextMedium, size: 30)!
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes:
            [NSAttributedString.Key.foregroundColor: Colors.seanDarkGrey.withAlphaComponent(0.5),
             NSAttributedString.Key.font: placeholderFont])
        
        let indentView        = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftView              = indentView
        leftViewMode          = .always
    }
    
    func setUp(view: UIView, label: UILabel) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30).isActive = true
    }
}
