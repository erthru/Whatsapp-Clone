//
//  ChatCell.swift
//  Whatsapp Clone
//
//  Created by Suprianto Djamalu on 16/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class ChatCell: UITableViewCell {
    
    private let imgAvatar = UIImageView(image: UIImage(named: "img_placeholder"))
    private let lbUser = UILabel()
    private let lbMessage = UILabel()
    private let lbDate = UILabel()
    
    func build(chat: Chat){
        setupUI()
        
        imgAvatar.image = UIImage(named: chat.avatar)
        lbUser.text = chat.user
        lbMessage.text = chat.message
        lbDate.text = chat.date
    }
    
    private func setupUI(){
        
        // view
        self.addSubview(imgAvatar)
        self.addSubview(lbUser)
        self.addSubview(lbMessage)
        self.addSubview(lbDate)
        
        // imgAvatar
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imgAvatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        imgAvatar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imgAvatar.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imgAvatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        imgAvatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 60 / 2
        
        // lbUser
        lbUser.translatesAutoresizingMaskIntoConstraints = false
        lbUser.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -12).isActive = true
        lbUser.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 10).isActive = true
        lbUser.text = "User"
        lbUser.font = UIFont.boldSystemFont(ofSize: 18)
        
        // lbMessage
        lbMessage.translatesAutoresizingMaskIntoConstraints = false
        lbMessage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 12).isActive = true
        lbMessage.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 10).isActive = true
        lbMessage.text = "message example"
        lbMessage.textColor = .gray
        lbMessage.font = UIFont.systemFont(ofSize: 15)
        
        // lbDate
        lbDate.translatesAutoresizingMaskIntoConstraints = false
        lbDate.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        lbDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        lbDate.text = "Today"
        lbDate.font = UIFont.systemFont(ofSize: 15)
        lbDate.textColor = .gray
        
    }
    
}
