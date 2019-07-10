//
//  Discover.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/7/3.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import UIKit

struct DiscoverSection {
    var models: [DiscoverModel] = []
}

struct DiscoverModel {
    
    enum DiscoverType {
        case moment
        case scan
        case shake
        case news
        case search
        case nearby
        case shop
        case game
        case miniProgram
    }
    
    var type: DiscoverType
    var image: UIImage?
    var title: String
    var unread: Bool = false
    var unreadCount: Int = 0
    
    init(type: DiscoverType, title: String, icon: String, color: UIColor? = nil) {
        self.type = type
        self.title = title
        self.image = UIImage.SVGImage(named: icon, fillColor: color)
        self.unread = false
        self.unreadCount = 0
    }
}