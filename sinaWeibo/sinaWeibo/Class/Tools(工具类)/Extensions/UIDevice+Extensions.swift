//
//  UIDevice+Extensions.swift
//  sinaWeibo
//
//  Created by wusheng on 2018/10/8.
//  Copyright © 2018年 ws. All rights reserved.
//

import Foundation

extension UIDevice {
    func is_iphoneX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}

