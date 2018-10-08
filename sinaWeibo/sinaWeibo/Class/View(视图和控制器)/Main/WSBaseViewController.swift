//
//  WSBaseViewController.swift
//  sinaWeibo
//
//  Created by ws on 2018/2/8.
//  Copyright © 2018年 ws. All rights reserved.
//

import UIKit

class WSBaseViewController: UIViewController {
    
    var tableView : UITableView?
    
    
    /// 自定义导航条
    lazy var navBar = WSNavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIDevice.current.is_iphoneX() ? 88 : 64))
    /// 自定义导航条目
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.cz_random()
        
        setupUI()
        
    }
    
    // 设置导航条目的title
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }

}

// MARK: - 设置界面
extension WSBaseViewController {
    @objc func setupUI() {
        
        setupNavigationBar()
        
        setupTableView()
        
        if #available(iOS 11.0, *) {
            tableView?.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        
    }
    
    // 设置导航条
    private func setupNavigationBar() {
//        navBar.backgroundColor = UIColor.red
        // 添加导航条
        view.addSubview(navBar)
        // item 设置给 bar
        navBar.items = [navItem]
        // 设置navBar的字体颜色
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.darkGray]
    }
    // 设置tableView
    private func setupTableView() {
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.insertSubview(tableView!, belowSubview: navBar)
        // 设置内边距
//        let height = tabBarController?.tabBar.bounds.height
        tableView?.contentInset = UIEdgeInsetsMake(navBar.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
    }
    
}

// MARK: - UITableViewDataSource,UITableViewDelegate
extension WSBaseViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}













