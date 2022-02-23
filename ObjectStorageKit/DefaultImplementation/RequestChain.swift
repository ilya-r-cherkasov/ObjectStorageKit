//
//  RequestChain.swift
//  ObjectStorageKit
//
//  Created by Ilya Cherkasov on 23.02.2022.
//

import Foundation

open class RequestChain<Model: Codable>: AbstractRequestChain {
    
    typealias Metadata = [String: String]
    typealias URLPath = URL
    typealias Session = URLSessionConfiguration
    typealias RequestPerformer = DefaultRequestPerformer
    typealias DTOModel = Model
    
    var requestPerformer: DefaultRequestPerformer
    var url: URLPath
    
    init(url: URLPath, requestPerformer: DefaultRequestPerformer) {
        self.requestPerformer = requestPerformer
        self.url = url
    }
    
    func buildRequest() {}
    
}

open class DefaultRequestPerformer: AbstractRequestPerformer {
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func makeRequset(completion: @escaping Closure<Result<Data, Error>>) {
        let requset = URLRequest(url: url)
        URLSession.shared.dataTask(
            with: requset
        ) { data, _, error in
            if let data = data {
                completion(.success(data))
            }
            if let error = error {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
}
