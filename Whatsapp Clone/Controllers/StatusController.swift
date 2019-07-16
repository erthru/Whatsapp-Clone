//
//  StatusController.swift
//  Whatsapp Clone
//
//  Created by Suprianto Djamalu on 16/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class StatusController: UIViewController {
    
    private let searchBar = UISearchController(searchResultsController: nil)
    private let scrollView = UIScrollView()
    private let viewMyStatus = UIView()
    private let imgAvatar = UIImageView(image: UIImage(named: "img_user1"))
    private let lbMyStatus = UILabel()
    private let lbAddToMyStatus = UILabel()
    private let imgPlus = UIImageView(image: UIImage(named: "img_plus"))
    private let imgPencil = UIImageView(image: UIImage(named: "img_pencil"))
    private let imgCamera = UIImageView(image: UIImage(named: "img_camera_fill"))
    private let lbRecentUpdates = UILabel()
    private let tableRecentUpdates = UITableView()
    
    private var recentUpdates = [RecentUpdate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        fillRecentUpdates()
    }
    
    private func fillRecentUpdates(){
        
        recentUpdates.append(RecentUpdate(thumbnail: "img_thumb1", user: "Mayuko"))
        recentUpdates.append(RecentUpdate(thumbnail: "img_thumb2", user: "Yuki"))
        recentUpdates.append(RecentUpdate(thumbnail: "img_thumb3", user: "Wakana"))
        recentUpdates.append(RecentUpdate(thumbnail: "img_thumb4", user: "Mayu"))
        recentUpdates.append(RecentUpdate(thumbnail: "img_thumb5", user: "Tambala"))
        recentUpdates.append(RecentUpdate(thumbnail: "img_thumb6", user: "Kurisu"))
        
        self.tableRecentUpdates.reloadData()
        
        DispatchQueue.main.async {
            self.scrollView.contentSize.height = self.tableRecentUpdates.contentSize.height + 200
        }
        
    }
    
    private func setupUI(){
        
        // view
        view.backgroundColor = .lightGray
        view.addSubview(scrollView)
        
        // navigation
        navigationItem.title = "Status"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Privacy", style: .done, target: self, action: nil)
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.addSubview(viewMyStatus)
        scrollView.addSubview(lbRecentUpdates)
        scrollView.addSubview(tableRecentUpdates)
        
        // viewMyStatus
        viewMyStatus.translatesAutoresizingMaskIntoConstraints = false
        viewMyStatus.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 38).isActive = true
        viewMyStatus.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        viewMyStatus.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewMyStatus.heightAnchor.constraint(equalToConstant: 92).isActive = true
        viewMyStatus.backgroundColor = .white
        viewMyStatus.addSubview(imgAvatar)
        viewMyStatus.addSubview(lbMyStatus)
        viewMyStatus.addSubview(lbAddToMyStatus)
        viewMyStatus.addSubview(imgPlus)
        viewMyStatus.addSubview(imgPencil)
        viewMyStatus.addSubview(imgCamera)
        
        // imgAvatar
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.leadingAnchor.constraint(equalTo: viewMyStatus.leadingAnchor, constant: 16).isActive = true
        imgAvatar.centerYAnchor.constraint(equalTo: viewMyStatus.centerYAnchor).isActive = true
        imgAvatar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imgAvatar.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 60 / 2
        
        // lbMyStatus
        lbMyStatus.translatesAutoresizingMaskIntoConstraints = false
        lbMyStatus.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 16).isActive = true
        lbMyStatus.centerYAnchor.constraint(equalTo: viewMyStatus.centerYAnchor, constant: -12).isActive = true
        lbMyStatus.text = "My Status"
        lbMyStatus.font = UIFont.boldSystemFont(ofSize: 19)
        
        // lbAddToMyStatus
        lbAddToMyStatus.translatesAutoresizingMaskIntoConstraints = false
        lbAddToMyStatus.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: 16).isActive = true
        lbAddToMyStatus.centerYAnchor.constraint(equalTo: viewMyStatus.centerYAnchor, constant: 12).isActive = true
        lbAddToMyStatus.text = "Add to my status"
        lbAddToMyStatus.font = UIFont.systemFont(ofSize: 14)
        lbAddToMyStatus.textColor = .gray
        
        // imgPlus
        imgPlus.translatesAutoresizingMaskIntoConstraints = false
        imgPlus.bottomAnchor.constraint(equalTo: viewMyStatus.bottomAnchor, constant: -14).isActive = true
        imgPlus.leadingAnchor.constraint(equalTo: imgAvatar.trailingAnchor, constant: -22).isActive = true
        imgPlus.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imgPlus.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        // imgPencil
        imgPencil.translatesAutoresizingMaskIntoConstraints = false
        imgPencil.centerYAnchor.constraint(equalTo: viewMyStatus.centerYAnchor).isActive = true
        imgPencil.trailingAnchor.constraint(equalTo: viewMyStatus.trailingAnchor, constant: -20).isActive = true
        imgPencil.heightAnchor.constraint(equalToConstant: 34).isActive = true
        imgPencil.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        // imgCamera
        imgCamera.translatesAutoresizingMaskIntoConstraints = false
        imgCamera.centerYAnchor.constraint(equalTo: viewMyStatus.centerYAnchor).isActive = true
        imgCamera.trailingAnchor.constraint(equalTo: imgPencil.leadingAnchor, constant: -16).isActive = true
        imgCamera.heightAnchor.constraint(equalToConstant: 34).isActive = true
        imgCamera.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        // lbRecentUpdates
        lbRecentUpdates.translatesAutoresizingMaskIntoConstraints = false
        lbRecentUpdates.topAnchor.constraint(equalTo: viewMyStatus.bottomAnchor, constant: 38).isActive = true
        lbRecentUpdates.leadingAnchor.constraint(equalTo: viewMyStatus.leadingAnchor, constant: 20).isActive = true
        lbRecentUpdates.text = "RECENT UPDATES"
        lbRecentUpdates.textColor = .gray
        
        // tableRecentUpdates
        tableRecentUpdates.translatesAutoresizingMaskIntoConstraints = false
        tableRecentUpdates.topAnchor.constraint(equalTo: lbRecentUpdates.bottomAnchor, constant: 10).isActive = true
        tableRecentUpdates.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        tableRecentUpdates.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableRecentUpdates.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableRecentUpdates.isScrollEnabled = false
        tableRecentUpdates.tableFooterView = UIView()
        tableRecentUpdates.register(RecentUpdatesCell.self, forCellReuseIdentifier: "RecentUpdatesCell")
        tableRecentUpdates.delegate = self
        tableRecentUpdates.dataSource = self

    }
    
}


extension StatusController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentUpdatesCell") as! RecentUpdatesCell
        cell.selectionStyle = .none
        cell.build(recentUpdates: recentUpdates[indexPath.row])
        return cell
    }
    
}

extension StatusController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentUpdates.count
    }
}
