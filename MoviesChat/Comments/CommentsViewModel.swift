//
//  CommentsViewModel.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class CommentsViewModel: NSObject {

    private(set) var items: [Comment] = []
    private(set) var movie: Movie!
    
    init(movie: Movie) {
        self.movie = movie
    }
    
}
