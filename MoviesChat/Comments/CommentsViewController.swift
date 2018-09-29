//
//  CommentsViewController.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var tv: UITableView!
    
    private(set) var commentsViewModel: CommentsViewModel!
    
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()

        commentsViewModel = CommentsViewModel(movie: movie)
        
        setup_cell()
        
    }
    
    func setup_cell() {
        tv.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
    }

}
