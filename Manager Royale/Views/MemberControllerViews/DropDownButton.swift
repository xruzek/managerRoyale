//
//  DropDownButton.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class DropDownButton: UIButton, dismissSortTabelProtocol {
    
    
    var dropView = dropDownView()
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        /*self.backgroundColor = .gray
        self.setTitleColor(.black, for: .normal)*/
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        self.setTitleColor(.black, for: .normal)
        setTitle("Sorted by: ", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 14)
       
        dropView = dropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropView.translatesAutoresizingMaskIntoConstraints = false
        
        dropView.delegate = memberViewDelegate
        dropView.otherDelegate = self
        
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        
        //dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.bottomAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    func dismissDropDown() {
        // call when button is pressed
        isOpen = false
        
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.dropView.center.y += self.dropView.frame.height/2
            self.dropView.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isOpen {
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            if self.dropView.dropDownTableView.contentSize.height > 120 {
                self.height.constant = 120
            } else {
                self.height.constant = self.dropView.dropDownTableView.contentSize.height
            }
            
            
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y -= self.dropView.frame.height/2
            }, completion: nil)
            
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                self.dropView.center.y += self.dropView.frame.height/2
                self.dropView.layoutIfNeeded()
                
            }, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func editConstraints(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: 4).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        widthAnchor.constraint(equalToConstant: 150).isActive = true
        heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
