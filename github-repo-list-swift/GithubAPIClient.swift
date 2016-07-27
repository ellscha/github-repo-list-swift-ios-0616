//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completion:(NSArray) -> ()){
        let clientSecretKey = "2744fa7527429d8716ec7f58d2ade97a7e790ce6"
        let clientID = "9d5dcb7a048c33dda633"
        let githubAPIURL = "https://api.github.com"
        let urlString = "\(githubAPIURL)/repositories?client_id\(clientID)=&client_secret=\(clientSecretKey)"
        
        let tempArray = []
        
        
        let session = NSURLSession.sharedSession()
        
        if let url = NSURL(string:urlString) {
            var dataTask = session.dataTaskWithURL(url){data,error,response in
                print(data)
                print(response)
                print(error)
                
                
                var array = []
                do {
                    if let jsonData = data {
                        array = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as! NSArray
                        print(array)
                        completion(array)
                    }
                    
                }catch{
                    
                    print(error)
                    
                }
                
            }
            dataTask.resume()
        }
        
    }
    
}


