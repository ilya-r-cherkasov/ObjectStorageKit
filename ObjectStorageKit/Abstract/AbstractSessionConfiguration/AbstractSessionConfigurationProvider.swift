//
//  AbstractSessionConfigProvider.swift
//  ObjectStorageKit
//
//  Created by Ilya Cherkasov on 20.02.2022.
//

import Foundation

protocol AbstractSessionConfigurationProvider: AnyObject,
    AbstractProvider where Provided == AbstractSessionConfiguration {
}

protocol AbstractSessionConfiguration: AnyObject {
    
    var timeout: TimeInterval { get set }
    
}
