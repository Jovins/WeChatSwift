//
//  ChatRoomMemberItemNode.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/8/7.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import AsyncDisplayKit

class ChatRoomMemberItemNode: ASDisplayNode {
    
    private let avatarNode = ASNetworkImageNode()
    
    private let nameNode = ASTextNode()
    
    private let addButtonNode = ASButtonNode()
    
    private let memberItem: AddChatRoomMemberItem
    
    init(item: AddChatRoomMemberItem) {
        
        self.memberItem = item
        
        super.init()
        
        automaticallyManagesSubnodes = true
        
        switch item {
        case .addButton:
            addButtonNode.setImage(UIImage(named: "AddGroupMemberBtn_50x50_"), for: .normal)
            addButtonNode.setImage(UIImage(named: "AddGroupMemberBtnHL_50x50_"), for: .highlighted)
        case .contact(let contact):
            avatarNode.image = contact.avatar
            avatarNode.cornerRoundingType = .precomposited
            avatarNode.cornerRadius = 4
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            nameNode.attributedText = NSAttributedString(string: contact.name, attributes: [
                .font: UIFont.systemFont(ofSize: 12),
                .foregroundColor: UIColor(hexString: "#454545"),
                .paragraphStyle: paragraphStyle
                ])
        }
    }
    
    override func didLoad() {
        super.didLoad()
        
        addButtonNode.addTarget(self, action: #selector(addButtonClicked), forControlEvents: .touchUpInside)
    }
    
    @objc private func addButtonClicked() {
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        switch memberItem {
        case .addButton:
            addButtonNode.style.preferredSize = CGSize(width: 50, height: 50)
            addButtonNode.style.layoutPosition = CGPoint(x: constrainedSize.max.width - 50, y: (constrainedSize.max.height - 50)/2)
            
            return ASAbsoluteLayoutSpec(children: [addButtonNode])
        case .contact(_):
            avatarNode.style.preferredSize = CGSize(width: 50, height: 50)
            avatarNode.style.layoutPosition = CGPoint(x: constrainedSize.max.width - 50, y: (constrainedSize.max.height - 50)/2)
            
            nameNode.style.preferredSize = CGSize(width: 50, height: 14)
            nameNode.style.layoutPosition = CGPoint(x: constrainedSize.max.width - 50, y: constrainedSize.max.height - 15)
            
            return ASAbsoluteLayoutSpec(children: [avatarNode, nameNode])
        }
    }
    
}
