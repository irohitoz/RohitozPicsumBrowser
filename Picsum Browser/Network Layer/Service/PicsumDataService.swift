//
//  PicsumDataService.swift
//  Picsum Browser
//
//  Created by Hindavi Technologies on 03/08/21.
//

import Foundation

class PicsumDataService: NSObject {
    
    func fetchPicsumData(completionHandler: @escaping ([Picsum]) -> Void) {
        let serviceUrl = kBaseServiceUrl
        APITaskManager.shared.serviceRequest(baseUrl: serviceUrl) { picSumData in
            completionHandler(picSumData)
        }
    }
}
