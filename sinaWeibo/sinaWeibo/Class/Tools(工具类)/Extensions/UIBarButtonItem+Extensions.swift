//
//  UIBarButtonItem+Extensions.swift
//  sinaWeibo
//
//  Created by wusheng on 2018/10/8.
//  Copyright © 2018年 ws. All rights reserved.
//

import Foundation

extension UIBarButtonItem {
    
    
    /// 创建UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: 字体大小，默认16
    ///   - target: target
    ///   - action: action
    ///   - isBack: 是否有返回按钮
    convenience init(title: String, fontSize: CGFloat = 16.0, target: Any?, action: Selector, isBack:Bool = false) {
        
        let btn : UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        if isBack {
            let imageName = "navigationbar_back_withtext"
            btn.setImage(UIImage.init(named: imageName), for: .normal)
            btn.setImage(UIImage.init(named: imageName + "_highlighted"), for: .highlighted)
            btn.sizeToFit()
        }
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView: btn)
    }
}


