//
//  MoviesViewModel.swift
//  MoviesChat
//
//  Created by Сергей Гаврилко on 29.09.2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class MoviesViewModel: NSObject {
    
    private(set) var items: [Movie] = []

    override init() {
        super.init()
        parseJSON()
        
    }
    
    private func parseJSON() {
        
        if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let items = jsonResult as? [[String: Any?]] {
                    for item in items {
                        self.items.append(Movie(title: item["title"] as? String ?? ""))
                    }
                }
            } catch {
                print("Error when parsing json")
            }
        }
        
    }

}
