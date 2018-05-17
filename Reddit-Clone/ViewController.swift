//
//  ViewController.swift
//  Reddit-Clone
//
//  Created by Maria Xina Rae Torres on 17/04/2018.
//  Copyright © 2018 Maria Xina Rae Torres. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
    var reddit = [RedditDataModel]()
    var subs = [SubscribeDataModel]()
    let dateFormatter = DateFormatter()
    let searchBar = UISearchBar()
    var anyObject = [Any]()
    var cellNumberArray = [Int]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subs.append(SubscribeDataModel())
        createSearchBar()
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        collectionView.dataSource = self
        let url = URL(string: "https://api.reddit.com/r/aww/")
        getRedditData(url: "https://api.reddit.com/r/aww/")
    }
    
    override func viewWillAppear(_ animated: Bool){
        let titleView = UIImageView(image: UIImage(named: "reddit bg"))
        self.navigationItem.titleView = titleView
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func createSearchBar(){
        searchBar.delegate = self
        searchBar.backgroundColor = UIColor.black
    }
    
    func getRedditData(url: String){
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess{
                let redditJSON : JSON = JSON(response.result.value!)
                self.storeRedditData(json: redditJSON)
            }else{
                print("Error: \(response.result.error)")
            }
        }
    }
    func storeRedditData(json: JSON){
        reddit.removeAll()
        let children = json["data"]["children"].arrayValue.count
        for child in 0...children{
            var redditDataModel = RedditDataModel()
            redditDataModel.subRedditImage = json["data"]["children"][child]["data"]["thumbnail"].stringValue
            redditDataModel.subReddit = json["data"]["children"][child]["data"]["subreddit_name_prefixed"].stringValue
            redditDataModel.user = "u/" + json["data"]["children"][child]["data"]["author"].stringValue
            redditDataModel.title = json["data"]["children"][child]["data"]["title"].stringValue
            redditDataModel.articleImage = json["data"]["children"][child]["data"]["preview"]["images"][0]["source"]["url"].stringValue
            redditDataModel.articleSubtitle = json["data"]["children"][child]["data"]["selftext"].stringValue
            redditDataModel.time = json["data"]["children"][child]["data"]["created_utc"].doubleValue
            reddit.append(redditDataModel)
        }
        
        for i in 0...reddit.count - 1{
            if i%4 == 0{
                anyObject.append(subs[0])
                anyObject.append(reddit[i])
            }else{
                anyObject.append(reddit[i])
            }
        }
        updateUIWithRedditData()
    }
    
    func updateUIWithRedditData(){
        for i in 0...anyObject.count - 1{
            let object = anyObject[i]
            if let currentObject = object as? RedditDataModel{
                let cellNumber = arc4random_uniform(3)
                cellNumberArray.append(Int(cellNumber))
            }else{
                cellNumberArray.append(3)
            }
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentObject = anyObject[indexPath.row]
        if let object = currentObject as? RedditDataModel {
            if (reddit[indexPath.row].articleSubtitle == nil ||
                reddit[indexPath.row].articleSubtitle == ""  ||
                reddit[indexPath.row].articleSubtitle == "self" ||
                reddit[indexPath.row].articleSubtitle == "null") {
                if cellNumberArray[indexPath.row] == 0{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "redditCell3", for: indexPath) as! RedditCVCell3
                    cell.titleLabel.text = reddit[indexPath.row].title
                    cell.subRedditImage.image = UIImage(named: reddit[indexPath.row].subRedditImage)
                    
                    cell.timeLabel.text =
                        dateFormatter.timeSince(
                            from: NSDate(timeIntervalSince1970: reddit[indexPath.row].time),
                            numericDates: true)
                    
                    
                    cell.userLabel.text = reddit[indexPath.row].user
                    cell.subRedditLabel.text = reddit[indexPath.row].subReddit
                    if let urlArticleImage = URL(string: reddit[indexPath.row].articleImage){
                        cell.articleImage.kf.setImage(with: urlArticleImage)
                    }else{
                        cell.articleImage.image = nil
                    }
                    if let urlSubredditImage = URL(string: reddit[indexPath.row].subRedditImage){
                        cell.subRedditImage.kf.setImage(with: urlSubredditImage)
                    }else{
                        cell.articleImage.image = nil
                    }
                    return cell
                }else if cellNumberArray[indexPath.row] == 1{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "redditCell2", for: indexPath) as! RedditCVCell2
                    cell.titleLabel.text = reddit[indexPath.row].title
                    cell.subRedditImage.image = UIImage(named: reddit[indexPath.row].subRedditImage)
                    
                    cell.timeLabel.text =
                        dateFormatter.timeSince(
                            from: NSDate(timeIntervalSince1970: reddit[indexPath.row].time),
                            numericDates: true)
                    
                    
                    cell.userLabel.text = reddit[indexPath.row].user
                    cell.subRedditLabel.text = reddit[indexPath.row].subReddit
                    if let urlArticleImage = URL(string: reddit[indexPath.row].articleImage){
                        cell.articleImage.kf.setImage(with: urlArticleImage)
                    }else{
                        cell.articleImage.image = nil
                    }
                    if let urlSubredditImage = URL(string: reddit[indexPath.row].subRedditImage){
                        cell.subRedditImage.kf.setImage(with: urlSubredditImage)
                    }else{
                        cell.articleImage.image = nil
                    }
                    return cell
                }else if cellNumberArray[indexPath.row] == 2{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "redditCell1", for: indexPath) as! RedditCVCell1
                    cell.titleLabel.text = reddit[indexPath.row].title
                    cell.subRedditImage.image = UIImage(named: reddit[indexPath.row].subRedditImage)
                    
                    cell.timeLabel.text =
                        dateFormatter.timeSince(
                            from: NSDate(timeIntervalSince1970: reddit[indexPath.row].time),
                            numericDates: true)
                    
                    
                    cell.userLabel.text = reddit[indexPath.row].user
                    cell.subRedditLabel.text = reddit[indexPath.row].subReddit
                    if let urlArticleImage = URL(string: reddit[indexPath.row].articleImage){
                        cell.articleImage.kf.setImage(with: urlArticleImage)
                    }else{
                        cell.articleImage.image = nil
                    }
                    if let urlSubredditImage = URL(string: reddit[indexPath.row].subRedditImage){
                        cell.subRedditImage.kf.setImage(with: urlSubredditImage)
                    }else{
                        cell.articleImage.image = nil
                    }
                    return cell
                }
            }
        }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subscribeCell", for: indexPath) as! SubscribeCell
                return cell
        }//else
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reddit.count
    }
    // ++++++++++++++++++++++++++ SIZE FOR ITEM AT
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let currentObject = anyObject[indexPath.row]
        if let object = currentObject as? RedditDataModel {
            return CGSize(width: 350, height: 337)
        }else{
            return CGSize(width: 350, height: 290)
        }
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationItem.titleView = searchBar
        searchBarSearchButtonClicked(searchBar)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keywords = searchBar.text
        let finalKeywords = keywords?.replacingOccurrences(of: " ", with: "+").lowercased()
        let searchURL = URL(string: "https://api.reddit.com/r/\(finalKeywords!)/")
        getRedditData(url: "https://api.reddit.com/r/\(finalKeywords!)/")
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 56)
    }
}
extension DateFormatter {
    /**
     Formats a date as the time since that date (e.g., “Last week, yesterday, etc.”).
     
     - Parameter from: The date to process.
     - Parameter numericDates: Determines if we should return a numeric variant, e.g. "1 month ago" vs. "Last month".
     
     - Returns: A string with formatted `date`.
     */
    func timeSince(from: NSDate, numericDates: Bool = false) -> String {
        let calendar = Calendar.current
        let now = NSDate()
        let earliest = now.earlierDate(from as Date)
        let latest = earliest == now as Date ? from : now
        let components = calendar.dateComponents([.year, .weekOfYear, .month, .day, .hour, .minute, .second], from: earliest, to: latest as Date)
        
        var result = ""
        
        if components.year! >= 2 {
            result = "\(components.year!) y"
        } else if components.year! >= 1 {
            if numericDates {
                result = "1y"
            } else {
                result = "1y"
            }
        } else if components.month! >= 2 {
            result = "\(components.month!)mo"
        } else if components.month! >= 1 {
            if numericDates {
                result = "1mo"
            } else {
                result = "1mo"
            }
        } else if components.weekOfYear! >= 2 {
            result = "\(components.weekOfYear!)w"
        } else if components.weekOfYear! >= 1 {
            if numericDates {
                result = "1w"
            } else {
                result = "1w"
            }
        } else if components.day! >= 2 {
            result = "\(components.day!)d"
        } else if components.day! >= 1 {
            if numericDates {
                result = "1d"
            } else {
                result = "Yesterday"
            }
        } else if components.hour! >= 2 {
            result = "\(components.hour!)h"
        } else if components.hour! >= 1 {
            if numericDates {
                result = "1h"
            } else {
                result = "1h"
            }
        } else if components.minute! >= 2 {
            result = "\(components.minute!)min"
        } else if components.minute! >= 1 {
            if numericDates {
                result = "1min"
            } else {
                result = "1min"
            }
        } else if components.second! >= 3 {
            result = "\(components.second!)s"
        } else {
            result = "Just now"
        }
        return result
    }
}

