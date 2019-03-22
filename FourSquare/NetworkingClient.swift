//
//  API.swift
//  FourSquare
//
//  Created by Param Veghal on 20/03/2019.
//  Copyright © 2019 ParamVeghal. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient {
    
    //typeAlias response to pass as parameter
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
    
    func execute(_ url: URL, completion: @escaping WebServiceResponse) {
        Alamofire.request(url).validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let jsonArray = response.result.value as? [[String: Any]] {
                completion(jsonArray, nil)
            } else if let jsonDict = response.result.value as? [String: Any] {
                completion([jsonDict], nil)
            }
        }
    }
}
