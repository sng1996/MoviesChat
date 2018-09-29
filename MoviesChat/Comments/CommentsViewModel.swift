//
//  CommentsViewModel.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit
import FirebaseDatabase

protocol CommentsViewModelDelegate {
    func updateTable()
}

class CommentsViewModel: NSObject {

    private(set) var items: [Comment] = []
    private(set) var movie: Movie!
    
    var delegate: CommentsViewModelDelegate!
    
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    init(delegate: CommentsViewModelDelegate, movie: Movie) {
        super.init()
        self.delegate = delegate
        self.movie = movie
        
        getAllComments()
    }
    
    func sendNewComment(_ text: String) {
        ref?.child("list").childByAutoId().setValue(["text": text, "movie": movie.title, "date": getDate()])
    }
    
    func getAllComments() {
        ref = Database.database().reference()
        handle = ref?.child("list").queryOrdered(byChild: "date").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? [String: Any] {
                if (item["movie"] as! String) == self.movie.title {
                    let comment = Comment(text: item["text"] as! String)
                    self.items.append(comment)
                    self.delegate.updateTable()
                }
            }
        })
    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm:ss"
        return dateFormatter.string(from: Date())
    }
    
}
