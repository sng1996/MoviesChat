//
//  CommentsViewController.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, CommentsViewModelDelegate {
    
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    private(set) var commentsViewModel: CommentsViewModel!
    
    var movie: Movie!
    var isKeyboardOpen: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        commentsViewModel = CommentsViewModel(delegate: self, movie: movie)
        
        setup_cell()
        setup_keyboardNotifications()
        setup_closeButton()
        setPositions()
        
    }
    
    func setup_cell() {
        tv.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
    }
    
    func setup_keyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func setup_closeButton() {
        closeButton.titleLabel?.text = "Back"
    }
    
    func setPositions() {
        
        tv.frame.size = CGSize(
            width: SGDevice.screenWidth,
            height: SGDevice.screenHeight - commentView.frame.size.height
        )
        
        commentView.frame.origin.y = tv.frame.maxY
        commentView.frame.size.width = SGDevice.screenWidth
        
        textField.frame.size.width = commentView.frame.size.width - closeButton.frame.size.width - sendButton.frame.size.width
        
        sendButton.frame.origin.x = textField.frame.maxX
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            tv.frame.size.height -= keyboardRectangle.height
            commentView.frame.origin.y -= keyboardRectangle.height
            closeButton.setTitle("Close", for: .normal)
            isKeyboardOpen = true
            updateTable()
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        tv.frame.size.height = SGDevice.screenHeight - commentView.frame.size.height
        commentView.frame.origin.y = tv.frame.maxY
        closeButton.setTitle("Back", for: .normal)
        isKeyboardOpen = false
    }
    
    @IBAction func close() {
        if isKeyboardOpen {
            textField.resignFirstResponder()
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let moviesViewController = storyBoard.instantiateViewController(withIdentifier: "MoviesViewController") as! MoviesViewController
            self.present(moviesViewController, animated: false, completion: nil)
        }
    }
    
    @IBAction func send() {
        if textField.text != "" {
            commentsViewModel.sendNewComment(textField.text!)
        }
        textField.text = ""
    }
    
    func updateTable() {
        tv.reloadData()
        tv.scrollToRow(at: IndexPath(row: commentsViewModel.items.count - 1, section: 0), at: .bottom, animated: true)
    }

}
