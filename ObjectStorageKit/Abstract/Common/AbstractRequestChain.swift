//
//  AbstractRequestChain.swift
//  ObjectStorageKit
//
//  Created by Ilya Cherkasov on 20.02.2022.
//

import Foundation

protocol AbstractRequestChain {
    
    /// Headers and other
    associatedtype Metadata
    
    /// URL
    associatedtype URLPath
    
    // Timeouts and others session confugurations
    associatedtype Session
    
    /// Framework that make perform, URLSession for example
    associatedtype RequestPerformer: AbstractRequestPerformer
    
    /// Expecred model for parfcing
    associatedtype DTOModel: Codable
    
    var requestPerformer: RequestPerformer { get set }
    
    func buildRequest()
    
}

extension AbstractRequestChain {
        
    func buildChain() {
        
    }
    
    func makeRequest() -> Observer<DTOModel> {
        let observer = Observer<DTOModel>(
            requestPerformer: requestPerformer
        )
        return observer
    }
    
}
