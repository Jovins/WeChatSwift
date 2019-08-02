//
//  WCNavigationController.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/7/23.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import UIKit

class WCNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage.imageFromColor(Colors.DEFAULT_BACKGROUND_COLOR)
        
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
        
        navigationBar.setBackgroundImage(backgroundImage, for: .default)
        navigationBar.backIndicatorImage = UIImage.SVGImage(named: "icons_outlined_back")
        navigationBar.backIndicatorTransitionMaskImage = UIImage.SVGImage(named: "icons_outlined_back")
    }
}
