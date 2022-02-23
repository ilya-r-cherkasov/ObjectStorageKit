//
//  AbstractRequestPerformerProvider.swift
//  ObjectStorageKit
//
//  Created by Ilya Cherkasov on 20.02.2022.
//

import Foundation

protocol AbstractRequestPerformerProvider: AnyObject,
    AbstractProvider where Provided == AbstractRequestPerformer {
}

protocol AbstractRequestPerformer {
    
    func makeRequset(completion: @escaping Closure<Result<Data, Error>>)
    
}
