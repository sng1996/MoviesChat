//
//  CommentsCellLabel.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class CommentsCellLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ text: String) {
        super.init(frame: .zero)
        
        let sideInset: CGFloat = 15.0
        let avatarWidth: CGFloat = 20.0
        let gap: CGFloat = 10.0
        
        let maxWidth = SGDevice.screenWidth - (2 * sideInset + avatarWidth + gap)
        
        self.text = text
        self.textAlignment = .left
        self.numberOfLines = 1000
        self.backgroundColor = .gray
        self.layer.cornerRadius = 3
        self.safeAreaInsets = UIEdgeInsets(
            top: 10,
            left: 0,
            bottom: 10,
            right: 0
        )
        self.frame.size = self.sizeThatFits(CGSize(
            width: maxWidth,
            height: 1000
        ))
    }
    
}
