//
//  SearchTableViewController.swift
//  Reddit-Clone
//
//  Created by Maria Xina Rae Torres on 17/04/2018.
//  Copyright © 2018 Maria Xina Rae Torres. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
let searchBar = UISearchBar()
    let tableData = ["Hard Work", "Perseverance", "Grit", "Persistence", "Discipline"]
    // variables added for search function
    var filteredArray = [String]()
    var shouldShowSearchResults = false
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
    }

    func createSearchBar(){

        searchBar.showsCancelButton = false
        searchBar.delegate = self
        searchBar.backgroundColor = UIColor.black
        self.navigationItem.titleView = searchBar
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    // functions for adding search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = tableData.filter({ (names: String) -> Bool in return names.lowercased().range(of: searchText.lowercased()) != nil
        })

        if searchText != ""{
            shouldShowSearchResults = true
            self.tableView.reloadData()
        }else{
            shouldShowSearchResults = false
            self.tableView.reloadData()
        }
    }
    //End function for adding search
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if shouldShowSearchResults{
            return filteredArray.count
        }
        else{
            return tableData.count
        }

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        if shouldShowSearchResults{
            cell.textLabel?.text = filteredArray[indexPath.row]
            return cell
        }
        else{
            cell.textLabel!.text = tableData[indexPath.row]
            return cell
        }
    }

    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        searchBar.endEditing(true)
        self.tableView.reloadData()
    }

}
