//
//  RecentUpdatesCell.swift
//  Whatsapp Clone
//
//  Created by Suprianto Djamalu on 16/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class RecentUpdatesCell: UITableViewCell {
    
    private let imgThumbnail = UIImageView(image: UIImage(named: "img_placeholder"))
    private let lbUser = UILabel()
    private let lbNew = UILabel()
    
    func build(recentUpdates: RecentUpdate){
        setupUI()
        
        imgThumbnail.image = UIImage(named: recentUpdates.thumbnail)
        lbUser.text = recentUpdates.user
    }
    
    private func setupUI(){
        
        // view
        self.addSubview(imgThumbnail)
        self.addSubview(lbUser)
        self.addSubview(lbNew)
        
        // imgThumbnail
        imgThumbnail.translatesAutoresizingMaskIntoConstraints = false
        imgThumbnail.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        imgThumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        imgThumbnail.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        imgThumbnail.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imgThumbnail.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imgThumbnail.layer.masksToBounds = true
        imgThumbnail.layer.cornerRadius = 60 / 2
        imgThumbnail.layer.borderColor = UIColor.blue.cgColor
        imgThumbnail.layer.borderWidth = 2
        
        // lbUser
        lbUser.translatesAutoresizingMaskIntoConstraints = false
        lbUser.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -12).isActive = true
        lbUser.leadingAnchor.constraint(equalTo: imgThumbnail.trailingAnchor, constant: 16).isActive = true
        lbUser.text = "user"
        lbUser.font = UIFont.boldSystemFont(ofSize: 19)
        
        // lbNew
        lbNew.translatesAutoresizingMaskIntoConstraints = false
        lbNew.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 12).isActive = true
        lbNew.leadingAnchor.constraint(equalTo: imgThumbnail.trailingAnchor, constant: 16).isActive = true
        lbNew.text = "1 new"
        lbNew.font = UIFont.systemFont(ofSize: 14)
        lbNew.textColor = .gray
        
    }
    
}
