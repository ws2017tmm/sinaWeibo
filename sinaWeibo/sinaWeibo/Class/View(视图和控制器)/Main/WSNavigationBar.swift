//
//  WSNavigationBar.swift
//  sinaWeibo
//
//  Created by wusheng on 2018/10/8.
//  Copyright © 2018年 ws. All rights reserved.
//

import UIKit

class WSNavigationBar: UINavigationBar {

    override func layoutSubviews() {
        super.layoutSubviews()

        // 当前系统版本
        let systemVersion = Float(UIDevice.current.systemVersion) ?? 0.0

        for subview in self.subviews {
            // iOS10之前使用的是_UINavigationBarBackground, iOS10起改为_UIBarBackground
            if systemVersion >= 11.0 {
                let classStr = NSStringFromClass(subview.classForCoder)
                if classStr.contains("_UIBarBackground") {
                    var frame = subview.frame
                    frame.size.height = 64
                    if UIDevice.current.is_iphoneX() {
//                        frame.origin.y = 24
                        
                        frame.size.height = 88
                    }
                    subview.frame = frame
//                    subview.frame = self.bounds
                }
                
                if classStr.contains("_UINavigationBarContentView") {
                    var frame = subview.frame
                    frame.origin.y = 20
                    if UIDevice.current.is_iphoneX() {
                        frame.origin.y = 20+24
                    }
                    subview.frame = frame
                }
            }
           
        }
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        for subview in self.subviews {
//            let stringFromClass = NSStringFromClass(subview.classForCoder)
//            print("--------- \(stringFromClass)")
//            if stringFromClass.contains("BarBackground") {
//                subview.frame = self.bounds
//            } else if stringFromClass.contains("UINavigationBarContentView") {
//                subview.frame = CGRect(x: 0, y: 20, width: UIScreen.cz_screenWidth(), height: 44)
//            }
//        }
//    }

}
