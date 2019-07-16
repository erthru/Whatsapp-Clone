//
//  CallCell.swift
//  Whatsapp Clone
//
//  Created by Suprianto Djamalu on 16/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class CallCell: UITableViewCell {
    
    let imgAvatar = UIImageView(image: UIImage(named: "img_placeholder"))
    let lbUser = UILabel()
    let lbType = UILabel()
    let imgCall = UIImageView(image: UIImage(named: "img_calls"))
    let imgInfo = UIImageView(image: UIImage(named: "img_info"))
    let lbDate = UILabel()
    
    func build(call: Call){
        setupUI()
        
        imgAvatar.image = UIImage(named: call.avatar)
        lbUser.text = call.user
        lbType.text = call.type
        lbDate.text = call.date
        
        if call.type == "missed" {
            lbUser.textColor = .red
        }
    }
    
    private func setupUI(){
        
        // view
        self.addSubview(imgAvatar)
        self.addSubview(lbUser)
        self.addSubview(imgCall)
        self.addSubview(lbType)
        self.addSubview(imgInfo)
        self.addSubview(lbDate)
        
        // imgAvatar
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imgAvatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        imgAvatar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imgAvatar.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imgAvatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        imgAvatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 50 / 2
        
        // lbUser
        lbUser.translatesAutoresizingMaskIntoConstraints = false
        lbUser.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -12).isActive = true
        lbUser.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 16).isActive = true
        lbUser.text = "user"
        lbUser.font = UIFont.systemFont(ofSize: 18)
        
        // imgCall
        imgCall.translatesAutoresizingMaskIntoConstraints = false
        imgCall.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 12).isActive = true
        imgCall.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 16).isActive = true
        imgCall.heightAnchor.constraint(equalToConstant: 16).isActive = true
        imgCall.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imgCall.tintColor = .gray
        
        // lbType
        lbType.translatesAutoresizingMaskIntoConstraints = false
        lbType.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
        lbType.leadingAnchor.constraint(equalTo: imgCall.trailingAnchor, constant: 6).isActive = true
        lbType.text = "outgoing"
        lbType.font = UIFont.systemFont(ofSize: 14)
        lbType.textColor = .gray
        
        // imgInfo
        imgInfo.translatesAutoresizingMaskIntoConstraints = false
        imgInfo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imgInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        imgInfo.heightAnchor.constraint(equalToConstant: 34).isActive = true
        imgInfo.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        // lbDate
        lbDate.translatesAutoresizingMaskIntoConstraints = false
        lbDate.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lbDate.trailingAnchor.constraint(equalTo: imgInfo.leadingAnchor, constant: -10).isActive = true
        lbDate.text = "Today"
        lbDate.textColor = .gray
        lbDate.font = UIFont.systemFont(ofSize: 14)
        
    }
    
}
