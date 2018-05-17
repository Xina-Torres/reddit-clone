//
//  RedditCVCell1.swift
//  Reddit-Clone
//
//  Created by Maria Xina Rae Torres on 23/04/2018.
//  Copyright © 2018 Maria Xina Rae Torres. All rights reserved.
//

import UIKit

class RedditCVCell1: UICollectionViewCell {
    @IBOutlet weak var subRedditImage: UIImageView! // [DATA] [CHILDREN][DATA][THUMBNAIL]
    @IBOutlet weak var subRedditLabel: UILabel! // [DATA][CHILDREN][DATA][subreddit_name_prefixed]
    @IBOutlet weak var timeLabel: UILabel! // static
    @IBOutlet weak var optionButton: UIButton! // static
    @IBOutlet weak var userLabel: UILabel! // USER = [DATA][CHILDREN][DATA][AUTHOR]
    @IBOutlet weak var titleLabel: UILabel! // titleLabel = [DATA][CHILDREN][DATA][TITLE]
    @IBOutlet weak var articleImage: UIImageView! // [DATA][CHILDREN][DATA][PREVIEW][IMAGES][SOURCE][URL]
    @IBOutlet weak var subtitleLabel: UILabel! //
    @IBOutlet weak var upvoteButton: UIButton! // static
    @IBOutlet weak var downvoteButton: UIButton! // static
    @IBOutlet weak var commentButton: UIButton! // static
    @IBOutlet weak var shareButton: UIButton! // static
}
