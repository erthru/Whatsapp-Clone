//
//  SettingCell.swift
//  Whatsapp Clone
//
//  Created by Suprianto Djamalu on 16/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class SettingCell: UITableViewCell {
    
    private let imgIcon = UIImageView(image: UIImage(named: "img_placeholder"))
    private let lbName = UILabel()
    
    func build(setting: Setting){
        
        if setting.name == "break" {
            setupUIBreak()
        }else{
            setupUI()
            imgIcon.image = UIImage(named: setting.icon)
            lbName.text = setting.name
        }
        
    }
    
    private func setupUI(){
        
        // view
        self.addSubview(imgIcon)
        self.addSubview(lbName)
        
        // imgIcon
        imgIcon.translatesAutoresizingMaskIntoConstraints = false
        imgIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imgIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        imgIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        imgIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        imgIcon.heightAnchor.constraint(equalToConstant: 32).isActive = true
        imgIcon.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        // lbName
        lbName.translatesAutoresizingMaskIntoConstraints = false
        lbName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lbName.leadingAnchor.constraint(equalTo: imgIcon.trailingAnchor, constant: 16).isActive = true
        lbName.text = "Name"
        
    }
    
    private func setupUIBreak(){
        
        // view
        self.backgroundColor = .lightGray
        
    }
    
}
