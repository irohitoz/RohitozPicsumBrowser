//
//  APITaskManager.swift
//  Picsum Browser
//
//  Created by Hindavi Technologies on 03/08/21.
//

import Foundation
import SwiftyJSON

var kBaseServiceUrl: String {
    return Environment().configuration(Plist.baseUrl)
}

class APITaskManager: NSObject {
    static let shared = APITaskManager()
    func serviceRequest(baseUrl: String, completionHandler: @escaping ([Picsum]) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: baseUrl)!) { data, response, error in
            guard let data = data, error == nil  else {
                print("Service Request Failed!")
                return
            }
            
            var picsumArray =  [Picsum]()
            let newData = JSON(data).arrayValue
            
            for parsedData in newData {
                
                let picsumData = Picsum(json: parsedData)
                picsumArray.append(picsumData)
            }
            
            completionHandler(picsumArray)
        }
        task.resume()
    }
}
