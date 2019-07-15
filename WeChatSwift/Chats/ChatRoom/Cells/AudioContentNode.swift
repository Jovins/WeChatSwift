//
//  AudioContentNode.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/7/9.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import AsyncDisplayKit

class AudioContentNode: MessageContentNode {
    
    private let bubbleNode = ASImageNode()
    
    private let imageNode = ASImageNode()
    
    private let durationNode = ASTextNode()
    
    override init(message: Message) {
        
        let icon = message.isOutgoing ? "ChatRoom_Bubble_Text_Sender_Green_57x40_": "ChatRoom_Bubble_Text_Receiver_White_57x40_"
        bubbleNode.image = UIImage(named: icon)
        bubbleNode.style.flexShrink = 1
        
        super.init(message: message)
        
        addSubnode(bubbleNode)
        addSubnode(imageNode)
        addSubnode(durationNode)
        
        let image = message.isOutgoing ? "ChatRoom_Bubble_Voice_Sender_24x24_": "ChatRoom_Bubble_Voice_Receiver_24x24_"
        imageNode.image = UIImage.as_imageNamed(image)
        
        durationNode.attributedText = NSAttributedString(string: "4\"", attributes: [
            .font: UIFont.systemFont(ofSize: 13),
            .foregroundColor: Colors.DEFAULT_TEXT_COLOR
            ])
    }
 
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let stack = ASStackLayoutSpec.horizontal()
        stack.alignItems = .center
        imageNode.style.preferredSize = CGSize(width: 24, height: 24)
        
        let spacer = ASLayoutSpec()
        spacer.style.flexGrow = 1.0
        spacer.style.flexShrink = 1.0
        spacer.style.height = ASDimension(unit: .points, value: 40)
        spacer.style.minWidth = ASDimensionMake(20)
        
        if message.isOutgoing {
            imageNode.style.spacingAfter = 12
            imageNode.style.spacingBefore = 3
            stack.children = [spacer, durationNode, imageNode]
        } else {
            imageNode.style.spacingAfter = 3
            imageNode.style.spacingBefore = 12
            stack.children = [imageNode, durationNode, spacer]
        }
        
        let backgroundSpec = ASBackgroundLayoutSpec(child: stack, background: bubbleNode)
        return ASInsetLayoutSpec(insets: .zero, child: backgroundSpec)
    }
}
