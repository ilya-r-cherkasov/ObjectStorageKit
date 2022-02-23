//
//  ObserverProtocol.swift
//  ObjectStorageKit
//
//  Created by Ilya Cherkasov on 23.02.2022.
//

import Foundation

protocol ObservableProtocol {
    
    associatedtype Model
    
    var onCompleted: Closure<Model>? { get set }
    var onError: Closure<Error>? { get set }
    
}
