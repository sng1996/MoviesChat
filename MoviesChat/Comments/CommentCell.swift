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
    private var textView: CommentsCellTextView!
    
    func set(_ text: String) {
        
        if textView != nil {
            textView.removeFromSuperview()
        }
        
        let gap: CGFloat = 10.0
        
        avatarView.layer.cornerRadius = 10
        textView = CommentsCellTextView(text)
        textView.frame.origin = CGPoint(
            x: avatarView.frame.maxX + gap,
            y: 0
        )
        self.addSubview(textView)
        avatarView.center.y = textView.frame.size.height / 2
        
    }
    
}
