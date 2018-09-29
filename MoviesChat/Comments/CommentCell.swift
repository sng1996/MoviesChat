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
    private var label: CommentsCellLabel!
    
    func set(_ text: String) {
        
        if label != nil {
            label.removeFromSuperview()
        }
        
        let gap: CGFloat = 10.0
        
        avatarView.layer.cornerRadius = 10
        label = CommentsCellLabel(text)
        label.frame.origin = CGPoint(
            x: avatarView.frame.maxX + gap,
            y: 0
        )
        self.addSubview(label)
        avatarView.center.y = label.frame.size.height / 2
        
    }
    
}
