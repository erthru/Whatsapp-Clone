//
//  ChatsController.swift
//  Whatsapp Clone
//
//  Created by Suprianto Djamalu on 16/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class ChatsController: UIViewController {
    
    private let searchBar = UISearchController(searchResultsController: nil)
    private let scrollView = UIScrollView()
    private let btnBroadcastLists = UIButton(type: .system)
    private let btnNewGroup = UIButton(type: .system)
    private let viewLine = UIView()
    private let tableChat = UITableView()
    
    private var chats = [Chat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fillChats()
    }
    
    private func fillChats(){
        
        chats.append(Chat(avatar: "img_user2", user: "Mayuko", message: "Sukiate kudasai !!", date: "Today"))
        chats.append(Chat(avatar: "img_user3", user: "Yuki", message: "Doko ?", date: "Today"))
        chats.append(Chat(avatar: "img_user4", user: "Wakana", message: "Sukiiii", date: "Yesterday"))
        chats.append(Chat(avatar: "img_user5", user: "Mayu", message: "Baka!", date: "Yesterday"))
        chats.append(Chat(avatar: "img_user6", user: "Tambala", message: "Wut ????", date: "Yesterday"))
        
        tableChat.reloadData()
        
        DispatchQueue.main.async {
            self.scrollView.contentSize.height = self.tableChat.contentSize.height + 50
        }
        
    }
    
    private func setupUI(){
        
        // view
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        // navigation
        navigationItem.title = "Chats"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "img_compose"), style: .done, target: self, action: nil)
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.addSubview(btnBroadcastLists)
        scrollView.addSubview(btnNewGroup)
        scrollView.addSubview(viewLine)
        scrollView.addSubview(tableChat)
        
        // btnBroadcastLists
        btnBroadcastLists.translatesAutoresizingMaskIntoConstraints = false
        btnBroadcastLists.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        btnBroadcastLists.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        btnBroadcastLists.setTitle("Broadcast Lists", for: .normal)
        
        // btnNewGroup
        btnNewGroup.translatesAutoresizingMaskIntoConstraints = false
        btnNewGroup.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        btnNewGroup.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        btnNewGroup.setTitle("New Group", for: .normal)
        
        // viewLine
        viewLine.translatesAutoresizingMaskIntoConstraints = false
        viewLine.topAnchor.constraint(equalTo: btnNewGroup.bottomAnchor, constant: 10).isActive = true
        viewLine.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        viewLine.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        viewLine.backgroundColor = .lightGray
        
        // tableChat
        tableChat.translatesAutoresizingMaskIntoConstraints = false
        tableChat.topAnchor.constraint(equalTo: viewLine.bottomAnchor).isActive = true
        tableChat.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        tableChat.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableChat.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableChat.isScrollEnabled = false
        tableChat.tableFooterView = UIView()
        tableChat.register(ChatCell.self, forCellReuseIdentifier: "ChatCell")
        tableChat.delegate = self
        tableChat.dataSource = self
        
    }
    
}

extension ChatsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as! ChatCell
        cell.selectionStyle = .none
        cell.build(chat: chats[indexPath.row])
        return cell
    }
    
    
}

extension ChatsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
}
