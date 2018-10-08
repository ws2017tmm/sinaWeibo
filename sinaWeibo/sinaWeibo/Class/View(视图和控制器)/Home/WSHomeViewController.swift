//
//  WSHomeViewController.swift
//  sinaWeibo
//
//  Created by wusheng on 2018/2/7.
//  Copyright © 2018年 ws. All rights reserved.
//

import UIKit

class WSHomeViewController: WSBaseViewController {
    
    /// 微博数据数组
    private lazy var statusList = [String]()
    
    /// 加载数据
    private func loadData() {
        for i in 0..<20 {
            statusList.insert(i.description, at: 0)
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
//        let button = UIBarButtonItem.init(title: "好友", style: .plain, target: self, action: #selector(showNext))
//        let button = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showNext))
        
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", target: self, action: #selector(showNext))
        loadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showNext() {
        navigationController?.pushViewController(WSDemoViewController(), animated: true)
    }
    
    
    
}

// MARK: - tableViewDataSource,tableViewDelegate

extension WSHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        
        cell?.textLabel?.text = statusList[indexPath.row]
        
        return cell!
     }
    

    
}








