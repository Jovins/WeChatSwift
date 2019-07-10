//
//  Session.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/7/3.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import Foundation
import WCDBSwift

public class Session {
    
    var sessionID: String
    
    var name: String
    
    var avatar: String?
    
    var content: String? = nil
    
    /// 是否显示红点
    var showUnreadAsRedDot = false
    
    public init(sessionID: String, name: String) {
        self.sessionID = sessionID
        self.name = name
    }
}