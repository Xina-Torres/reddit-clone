//
//  RedditPresenter.swift
//  Reddit-Clone
//
//  Created by Maria Xina Rae Torres on 24/05/2018.
//  Copyright © 2018 Maria Xina Rae Torres. All rights reserved.
//

import Foundation

protocol RedditView {
    func showLoadRedditDataSuccess()
    func showLoadRedditDataError()
}

class RedditPresenter{
    
    var view: RedditListView
    var redditRepository: RedditRepository
    
    required init(view: RedditListView, redditRepository: RedditRepository){
        self.view = view
        self.redditRepository = redditRepository
    }
    
    func loadRedditData(keywords: String) {
        redditRepository.getRedditData_New(keywords: keywords) { (redditDataModelArray) in
            <#code#>
        }
    }
    
}
