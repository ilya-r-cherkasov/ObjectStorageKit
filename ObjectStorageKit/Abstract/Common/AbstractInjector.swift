//
//  AbstractInjector.swift
//  ObjectStorageKit
//
//  Created by Ilya Cherkasov on 20.02.2022.
//

import Foundation

protocol AbstractInjector {
    
    associatedtype Injected
        
    func inject() -> Injected
    
}

extension AbstractInjector where Self: AnyObject {
    
    func inject() -> Injected {
        fatalError(#function + "must be override")
    }
    
}
