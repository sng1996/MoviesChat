//
//  MoviesViewController.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var tv: UITableView!
    
    private(set) var moviesViewModel: MoviesViewModel = MoviesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup_cell()
        
    }
    
    private func setup_cell() {
        tv.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }

}

