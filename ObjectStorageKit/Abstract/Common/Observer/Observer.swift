//
//  Observer.swift
//  ObjectStorageKit
//
//  Created by Ilya Cherkasov on 23.02.2022.
//

import Foundation
import UIKit

open class Observer<Input: Decodable>: ObservableProtocol {
    
    // MARK: - Nested types
    
    typealias Model = Input
    
    enum ObeserverError: Error {
        case canNotParseData
    }
    
    var requestPerformer: AbstractRequestPerformer
    
    init(requestPerformer: AbstractRequestPerformer) {
        self.requestPerformer = requestPerformer
        startRequestProcess()
    }
    
    public var onCompleted: Closure<Input>?
    public var onError: Closure<Error>?
    
}

// MARK: - Private func

public extension Observer {
    
    func startRequestProcess() {
        requestPerformer.makeRequset { [weak self] result in
            self?.handleResult(result)
        }
    }
    
    func handleResult(_ result: Result<Data, Error>) {
        switch result {
        case .success(let data):
            guard let input = parse(from: data) else {
                onError?(ObeserverError.canNotParseData)
                return
            }
            onCompleted?(input)
        case .failure(let error):
            onError?(error)
        }
    }
    
    func parse(from data: Data) -> Input? {
        let parser = JSONDecoder()
        return try? parser.decode(Input.self, from: data)
    }
    
}
