//
//  RestApiManager.swift
//  RidesExample
//
//  Created by Joel Hollingsworth on 12/11/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//

import Foundation

class RestApiManager {
    
    // singleton pattern
    static let instance = RestApiManager()
    
    // must be on Elon's network
    let baseURL = "http://10.47.51.2:5000/dispatch/"
    
    func makeRequest(_ addOn: String, resultsHandler: @escaping ((String) -> Void)) {
        let address = "\(baseURL)\(addOn)"
        let escapedAddress = address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        makeHTTPGetRequest(path: escapedAddress!, resultsHandler)
    }
    
    // MARK: GET Request
    private func makeHTTPGetRequest(path: String, _ resultsHandler: @escaping ((String) -> Void)) {
        
        // setup the connection to the web server
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: path)!
        
        print(url)
        
        // in a new thread, ask the server for data
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let theResponse = String(data: data!, encoding: String.Encoding.ascii)
                resultsHandler(theResponse!)
            }
        })
        task.resume()
    }
}
