//
//  NetworkService.swift
//  Walkman
//
//  Created by Alexander Skrypnyk on 09.12.2019.
//  Copyright © 2019 Alexander Skrypnyk. All rights reserved.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        
        let url = "https://itunes.apple.com/search"
        let parameters = ["term":"\(searchText)", "media":"music"]
        
        
        //  Used Alamofire // почитать документацию об изменениях
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                print("objects: ", objects)
                completion(objects)
                
            } catch let jsonError {
                print("Error to decode JSON", jsonError)
                completion(nil)
            }
        }
    }
}
