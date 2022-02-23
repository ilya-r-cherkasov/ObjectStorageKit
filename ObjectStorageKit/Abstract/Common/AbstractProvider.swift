//
//  AbstractProvider.swift
//  ObjectStorageKit
//
//  Created by Ilya Cherkasov on 20.02.2022.
//

import Foundation

protocol AbstractProvider {
    
    associatedtype Provided
    
    func provide() -> Provided
    
}

extension AbstractProvider where Self: AnyObject {
    
    func provide() -> Provided {
        fatalError(#function + "must be override")
    }
    
}
