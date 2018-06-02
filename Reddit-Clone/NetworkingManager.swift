//
//  NetworkingManager.swift
//  Reddit-Clone
//
//  Created by Maria Xina Rae Torres on 02/06/2018.
//  Copyright © 2018 Maria Xina Rae Torres. All rights reserved.
//

import Alamofire
import Foundation


typealias Coordinates =

class NetworkingManager {
    
    
    static let instance = NetworkingManager()
    
    
    func queryReddit() {
        Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>).responseJSON(completionHandler: <#T##(DataResponse<Any>) -> Void#>)
        
        Alamofire.request(defaultURL, method: .get).responseJSON { response in
            if response.result.isSuccess{
                let redditJSON : JSON = JSON(response.result.value!)
                self.storeRedditData(json: redditJSON)
                completion(200, nil)
            }else{
                print("Error: \(response.result.error)")
            }
        }
    }
    
}
