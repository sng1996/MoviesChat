//
//  CommentsTableExtension.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CommentsCellLabel(commentsViewModel.items[indexPath.row].text).frame.size.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsViewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        cell.set(commentsViewModel.items[indexPath.row].text)
        return cell
    }


}
