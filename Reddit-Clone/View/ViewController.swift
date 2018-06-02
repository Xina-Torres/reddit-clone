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

class RedditListView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
    
    
    var redditPresenter : RedditPresenter!
    
    var reddit = [RedditDataModel]()
    let dateFormatter = DateFormatter()
    let searchBar = UISearchBar()
    var cellNumberArray = [Int]()
    var anyObject = [Any]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redditPresenter = RedditPresenter(view: self, reddit: RedditRepository())
        createSearchBar()
        collectionView.dataSource = self
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
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func updateUIWithRedditData(anyObject: [Any]){
        for i in 0...anyObject.count - 1{
            let object = anyObject[i]
            if let currentObject = object as? RedditDataModel{
                let cellNumber = arc4random_uniform(3) //choose between the 3 cell layouts
                cellNumberArray.append(Int(cellNumber))
            }else{
                cellNumberArray.append(3)
            }
        }
        print("Inside updateUIWithRedditData, in view: \(anyObject.count)")
        self.anyObject = anyObject
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentObject = anyObject[indexPath.row]
        if let object = currentObject as? RedditDataModel {
            //            if (reddit[indexPath.row].articleSubtitle == nil ||
            //                reddit[indexPath.row].articleSubtitle == ""  ||
            //                reddit[indexPath.row].articleSubtitle == "self" ||
            //                reddit[indexPath.row].articleSubtitle == "null") {
            if cellNumberArray[indexPath.row] == 0{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "redditCell3", for: indexPath) as! RedditCVCell3
                cell.titleLabel.text = (anyObject[indexPath.row] as! RedditDataModel).title
                cell.subRedditImage.image = UIImage(named: (anyObject[indexPath.row] as! RedditDataModel).subRedditImage)
                
                cell.timeLabel.text = ""
                //                        dateFormatter.timeSince(
                //                            from: NSDate(timeIntervalSince1970: reddit[indexPath.row].time),
                //                            numericDates: true)
                
                
                cell.userLabel.text = (anyObject[indexPath.row] as! RedditDataModel).user
                cell.subRedditLabel.text = (anyObject[indexPath.row] as! RedditDataModel).subReddit
                if let urlArticleImage = URL(string: (anyObject[indexPath.row] as! RedditDataModel).articleImage){
                    cell.articleImage.kf.setImage(with: urlArticleImage)
                }else{
                    cell.articleImage.image = nil
                }
                if let urlSubredditImage = URL(string: (anyObject[indexPath.row] as! RedditDataModel).subRedditImage){
                    cell.subRedditImage.kf.setImage(with: urlSubredditImage)
                }else{
                    cell.articleImage.image = nil
                }
                return cell
            }else if cellNumberArray[indexPath.row] == 1{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "redditCell2", for: indexPath) as! RedditCVCell2
                cell.titleLabel.text = (anyObject[indexPath.row] as! RedditDataModel).title
                cell.subRedditImage.image = UIImage(named: (anyObject[indexPath.row] as! RedditDataModel).subRedditImage)
                
                cell.timeLabel.text = ""
                //                        dateFormatter.timeSince(
                //                            from: NSDate(timeIntervalSince1970: reddit[indexPath.row].time),
                //                            numericDates: true)
                
                
                cell.userLabel.text = (anyObject[indexPath.row] as! RedditDataModel).user
                cell.subRedditLabel.text = (anyObject[indexPath.row] as! RedditDataModel).subReddit
                if let urlArticleImage = URL(string: (anyObject[indexPath.row] as! RedditDataModel).articleImage){
                    cell.articleImage.kf.setImage(with: urlArticleImage)
                }else{
                    cell.articleImage.image = nil
                }
                if let urlSubredditImage = URL(string: (anyObject[indexPath.row] as! RedditDataModel).subRedditImage){
                    cell.subRedditImage.kf.setImage(with: urlSubredditImage)
                }else{
                    cell.articleImage.image = nil
                }
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "redditCell1", for: indexPath) as! RedditCVCell1
                cell.titleLabel.text = (anyObject[indexPath.row] as! RedditDataModel).title
                cell.subRedditImage.image = UIImage(named: (anyObject[indexPath.row] as! RedditDataModel).subRedditImage)
                
                cell.timeLabel.text = ""
                //                        dateFormatter.timeSince(
                //                            from: NSDate(timeIntervalSince1970: reddit[indexPath.row].time),
                //                            numericDates: true)
                
                
                cell.userLabel.text = (anyObject[indexPath.row] as! RedditDataModel).user
                cell.subRedditLabel.text = (anyObject[indexPath.row] as! RedditDataModel).subReddit
                if let urlArticleImage = URL(string: (anyObject[indexPath.row] as! RedditDataModel).articleImage){
                    cell.articleImage.kf.setImage(with: urlArticleImage)
                }else{
                    cell.articleImage.image = nil
                }
                if let urlSubredditImage = URL(string: (anyObject[indexPath.row] as! RedditDataModel).subRedditImage){
                    cell.subRedditImage.kf.setImage(with: urlSubredditImage)
                }else{
                    cell.articleImage.image = nil
                }
                return cell
            }
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subscribeCell", for: indexPath) as! SubscribeCell
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.anyObject.count
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
        redditPresenter.loadRedditData(keywords: keywords)
    }
}
