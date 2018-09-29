//
//  CommentsCellTextView.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class CommentsCellTextView: UITextView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ text: String) {
        super.init(frame: CGRect.zero, textContainer: nil)
        
        let sideInset: CGFloat = 15.0
        let avatarWidth: CGFloat = 20.0
        let gap: CGFloat = 10.0
        
        let maxWidth = SGDevice.screenWidth - (2 * sideInset + avatarWidth + gap)
        
        self.text = text
        self.textAlignment = .left
        self.backgroundColor = .gray
        self.layer.cornerRadius = 3
        self.textContainerInset = UIEdgeInsetsMake(10, 0, 10, 0)
        self.frame.size = self.sizeThatFits(CGSize(
            width: maxWidth,
            height: 1000
        ))
    }
    
}
