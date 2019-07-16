//
//  CallsController.swift
//  Whatsapp Clone
//
//  Created by Suprianto Djamalu on 16/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit

class CallsController: UIViewController {
    
    private let searchBar = UISearchController(searchResultsController: nil)
    private let segmentHeader = UISegmentedControl(items: ["All","Missed"])
    private let tableCalls = UITableView()
    
    private var calls = [Call]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fillCalls()
    }
    
    private func fillCalls(){
        
        calls.append(Call(avatar: "img_user2", user: "Mayuko", type: "outgoing", date: "Today"))
        calls.append(Call(avatar: "img_user6", user: "Kurisu", type: "outgoing", date: "Sunday"))
        calls.append(Call(avatar: "img_user2", user: "Mayuko", type: "incoming", date: "Sunday"))
        calls.append(Call(avatar: "img_user2", user: "Mayuko", type: "outgoing", date: "Friday"))
        calls.append(Call(avatar: "img_user3", user: "Yuki", type: "outgoing", date: "Friday"))
        calls.append(Call(avatar: "img_user2", user: "Mayuko", type: "outgoing", date: "Thursday"))
        calls.append(Call(avatar: "img_user4", user: "Wakanda", type: "outgoing", date: "Thursday"))
        calls.append(Call(avatar: "img_user2", user: "Mayuko", type: "missed", date: "Wednesday"))
        calls.append(Call(avatar: "img_user5", user: "Tambala", type: "outgoing", date: "Wednesday"))
        
        tableCalls.reloadData()
        
    }
    
    private func setupUI(){
        
        // view
        view.backgroundColor = .lightGray
        view.addSubview(tableCalls)
        
        // navigation
        navigationItem.title = "Calls"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "img_calls_forward"), style: .done, target: self, action: nil)
         navigationItem.titleView = segmentHeader
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // segmentHeader
        segmentHeader.selectedSegmentIndex = 0
        
        // tableCell
        tableCalls.translatesAutoresizingMaskIntoConstraints = false
        tableCalls.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableCalls.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableCalls.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableCalls.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableCalls.tableFooterView = UIView()
        tableCalls.register(CallCell.self, forCellReuseIdentifier: "CallCell")
        tableCalls.delegate = self
        tableCalls.dataSource = self
        
    }
    
}

extension CallsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CallCell") as! CallCell
        cell.selectionStyle = .none
        cell.build(call: calls[indexPath.row])
        return cell
    }
}

extension CallsController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calls.count
    }
    
}
