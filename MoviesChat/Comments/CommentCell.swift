//
//  CommentCell.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    func set(_ text: String) {
        
        let sideInset: CGFloat = 15.0
        let avatarWidth: CGFloat = 20.0
        let gap: CGFloat = 10.0
        let maxWidth = SGDevice.screenWidth - (2 * sideInset + avatarWidth + gap)
        
        avatarView.layer.cornerRadius = 10
        textView.text = text
        textView.frame.size = textView.sizeThatFits(CGSize(
            width: maxWidth,
            height: 1000
        ))
        textView.frame.origin = CGPoint(
            x: avatarView.frame.maxX + gap,
            y: 5
        )
        self.addSubview(textView)
        avatarView.center.y = textView.frame.size.height / 2 + 5
        
    }
    
}
