//
//  PicsumDataRepository.swift
//  Picsum Browser
//
//  Created by Hindavi Technologies on 03/08/21.
//

import Foundation

protocol remotePicsumDataProtocol {
    func remoteFetchPicsumData(completionHandler: @escaping ([Picsum]) -> Void)
}

class PicsumDataRepository: NSObject {
    var picsumDataService: PicsumDataService?
}

extension PicsumDataRepository: remotePicsumDataProtocol {
    func remoteFetchPicsumData(completionHandler: @escaping ([Picsum]) -> Void) {
        picsumDataService?.fetchPicsumData(completionHandler: { picsumData in
            completionHandler(picsumData)
        })
    }
}
