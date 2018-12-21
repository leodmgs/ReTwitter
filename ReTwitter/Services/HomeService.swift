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
    
    private let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    private let cachedImage = NSCache<NSString, UIImage>()
    
    static let shared = HomeService()
    
    fileprivate init() {}
    
    public func fetchDatasource(path: String, completion: @escaping (HomeDatasource?, Error?) -> ()) {
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request(path)
        _ = request.perform(withSuccess: { (homeDatasource) in
            completion(homeDatasource, nil)
        }, failure: { (jsonError) in
            completion(nil, jsonError)
        })
    }
    
    public func downloadImage(url: String, completion: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
        if let image = cachedImage.object(forKey: url as NSString) {
            completion(image, nil)
            return
        }
        guard let urlImage = URL(string: url) else {
            completion(nil, NSError(domain: url, code: 1, userInfo: [NSURLErrorKey: "Invalid URL."]))
            return
        }
        URLSession.shared.dataTask(with: urlImage) { (data, resp, err) in
            DispatchQueue.main.async {
                if let dataResponse = data {
                    let image = UIImage(data: dataResponse)
                    if let imageFetched = image {
                        self.cachedImage.setObject(imageFetched, forKey: urlImage.absoluteString as NSString)
                        completion(imageFetched, nil)
                    }
                }
            }
        }.resume()
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            //@MARK
        }
    }
    
}
