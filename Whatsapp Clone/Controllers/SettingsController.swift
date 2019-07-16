//
//  SettingsController.swift
//  Whatsapp Clone
//
//  Created by Suprianto Djamalu on 16/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class SettingsController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let viewProfile = UIView()
    private let imgAvatar = UIImageView(image: UIImage(named: "img_user1"))
    private let lbUser = UILabel()
    private let lbStatus = UILabel()
    private let tableSetting = UITableView()
    
    private var settings = [Setting]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fillSettings()
    }
    
    private func fillSettings(){
        
        settings.append(Setting(icon: "img_star", name: "Starred Message"))
        settings.append(Setting(icon: "img_whatsapp", name: "WhatsApp Web/Desktop"))
        settings.append(Setting(icon: "", name: "break"))
        settings.append(Setting(icon: "img_account", name: "Account"))
        settings.append(Setting(icon: "img_chat_two", name: "Chats"))
        settings.append(Setting(icon: "img_notification", name: "Notification"))
        settings.append(Setting(icon: "img_data", name: "Data and Storage Usage"))
        settings.append(Setting(icon: "", name: "break"))
        settings.append(Setting(icon: "img_help", name: "Help"))
        settings.append(Setting(icon: "img_love", name: "Tell a Friend"))
        
        tableSetting.reloadData()
        
        DispatchQueue.main.async {
            self.scrollView.contentSize.height = self.tableSetting.contentSize.height + 160
        }
        
    }
    
    private func setupUI(){
        
        // view
        view.backgroundColor = .lightGray
        view.addSubview(scrollView)
        
        // navigation
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.addSubview(viewProfile)
        scrollView.addSubview(tableSetting)
        
        // viewProfile
        viewProfile.translatesAutoresizingMaskIntoConstraints = false
        viewProfile.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 38).isActive = true
        viewProfile.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        viewProfile.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewProfile.heightAnchor.constraint(equalToConstant: 92).isActive = true
        viewProfile.backgroundColor = .white
        viewProfile.addSubview(imgAvatar)
        viewProfile.addSubview(lbUser)
        viewProfile.addSubview(lbStatus)
        
        // imgAvatar
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.leadingAnchor.constraint(equalTo: viewProfile.leadingAnchor, constant: 16).isActive = true
        imgAvatar.centerYAnchor.constraint(equalTo: viewProfile.centerYAnchor).isActive = true
        imgAvatar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imgAvatar.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 60 / 2
        
        // lbUser
        lbUser.translatesAutoresizingMaskIntoConstraints = false
        lbUser.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 16).isActive = true
        lbUser.centerYAnchor.constraint(equalTo: viewProfile.centerYAnchor, constant: -12).isActive = true
        lbUser.text = "Alexa"
        lbUser.font = UIFont.boldSystemFont(ofSize: 19)
        
        // lbAddToMyStatus
        lbStatus.translatesAutoresizingMaskIntoConstraints = false
        lbStatus.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 16).isActive = true
        lbStatus.centerYAnchor.constraint(equalTo: viewProfile.centerYAnchor, constant: 12).isActive = true
        lbStatus.text = "medium.com/@erthru"
        lbStatus.font = UIFont.systemFont(ofSize: 14)
        lbStatus.textColor = .gray
        
        // tableSetting
        tableSetting.translatesAutoresizingMaskIntoConstraints = false
        tableSetting.topAnchor.constraint(equalTo: viewProfile.bottomAnchor, constant: 26).isActive = true
        tableSetting.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        tableSetting.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableSetting.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableSetting.tableFooterView = UIView()
        tableSetting.isScrollEnabled = false
        tableSetting.register(SettingCell.self, forCellReuseIdentifier: "SettingCell")
        tableSetting.delegate = self
        tableSetting.dataSource = self
        
    }
    
}


extension SettingsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell") as! SettingCell
        cell.selectionStyle = .none
        cell.build(setting: settings[indexPath.row])
        return cell
    }
}

extension SettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
}
