//
//  Build Configuration.swift
//  Picsum Browser
//
//  Created by Hindavi Technologies on 03/08/21.
//

import Foundation

public enum Plist {
    
    case baseUrl
    
    func value() -> String {
        switch self {
        case .baseUrl:
            return "baseUrl"
        }
    }
}

public struct Environment {
    public func configuration(_ key: Plist) -> String {
        if let infoDict = Bundle.main.infoDictionary {
            switch key {
            case .baseUrl:
                return infoDict[Plist.baseUrl.value()] as? String ?? ""
            }
        } else {
            fatalError("Unable to locate plist file")
        }
    }
}
