//
//  ViewController.swift
//  Whatsapp Clone
//
//  Created by Suprianto Djamalu on 16/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    private let tabBar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

    private func setupUI(){
        
        // view
        view.addSubview(tabBar.view)
        
        // navigation
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // tabBar
        let status = StatusController()
        status.tabBarItem = UITabBarItem.init(title: "Status", image: UIImage(named: "img_status"), tag: 0)
        let calls = CallsController()
        calls.tabBarItem = UITabBarItem.init(title: "Calls", image: UIImage(named: "img_calls"), tag: 1)
        let camera = CameraController()
        camera.tabBarItem = UITabBarItem.init(title: "Camera", image: UIImage(named: "img_camera"), tag: 2)
        let chats = ChatsController()
        chats.tabBarItem = UITabBarItem.init(title: "Chats", image: UIImage(named: "img_chats"), tag: 3)
        let settings = SettingsController()
        settings.tabBarItem = UITabBarItem.init(title: "Settings", image: UIImage(named: "img_settings"), tag: 0)
        let controllers = [status, calls, camera, chats, settings]
        tabBar.viewControllers = controllers.map({ UINavigationController(rootViewController: $0) })
        tabBar.delegate = self
    }

}

extension MainController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.tabBarItem.tag == 2{
            navigationController?.view.layer.add(TransitionHandler.bottomToTop(), forKey: kCATransition)
            navigationController?.pushViewController(CameraController(), animated: false)
            return false
        }
        
        return true
    }
    
}
