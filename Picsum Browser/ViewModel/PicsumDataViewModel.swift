//
//  PicsumDataViewModel.swift
//  Picsum Browser
//
//  Created by Hindavi Technologies on 03/08/21.
//

import Foundation

class PicsumDataViewModel: NSObject {
    
    private var picsumDataRepository: PicsumDataRepository
    
    init(repository: PicsumDataRepository) {
        self.picsumDataRepository = repository
        self.picsumDataRepository.picsumDataService = PicsumDataService()
    }
    
    func getPicsumData(completionHandler: @escaping ([Picsum]) -> Void) {
        picsumDataRepository.remoteFetchPicsumData { picsumdata in
            completionHandler(picsumdata)
        }
    }
}
