//
//  RequestCancelable.swift
//  ObjectStorageKit
//
//  Created by Ilya Cherkasov on 20.02.2022.
//

import Foundation

protocol RequestCancelable {
    
    func cancelRequest()
    
}

extension RequestCancelable where Self: AnyObject {
    
    func cancelRequest() {
        fatalError(#function + "должна быть перегружена")
    }
    
}
