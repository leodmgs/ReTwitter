//
//  HomeService.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/20/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct HomeService {
    
    fileprivate let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let shared = HomeService()
    
    fileprivate init() {}
    
    func fetchDatasource(path: String, completion: @escaping (HomeDatasource?, Error?) -> ()) {
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request(path)
        _ = request.perform(withSuccess: { (homeDatasource) in
            completion(homeDatasource, nil)
        }, failure: { (jsonError) in
            completion(nil, jsonError)
        })
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            //@MARK
        }
    }
    
}
