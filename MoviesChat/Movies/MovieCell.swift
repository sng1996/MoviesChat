//
//  MovieCell.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    func set(_ title: String) {
        self.label.text = title
    }
    
}
