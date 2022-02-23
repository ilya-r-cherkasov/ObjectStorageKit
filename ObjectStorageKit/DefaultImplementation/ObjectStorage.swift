//
//  File.swift
//  ObjectStorageKit
//
//  Created by Ilya Cherkasov on 20.02.2022.
//

import Foundation

public class ObjectStorage<Model: Codable> {
    
    // MARK: - Stored properties
    
    let url: URL
    
    // MARK: - Initialization
    
    public init(url: URL) {
        self.url = url
    }
    
    //MARK: - ТУТ ДОЛЖНЫ БЫТЬ ПРОВАЙДЕРЫ!
    
    lazy var requsetPerformer = DefaultRequestPerformer(url: url)
    
    // MARK: - Functions
    
    public func getObserver() -> Observer<Model> {
        Observer(requestPerformer: requsetPerformer)
    }
    
}
