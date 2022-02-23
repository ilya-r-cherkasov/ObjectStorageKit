//
//  ViewController.swift
//  ObjectStorageKitDemo
//
//  Created by Ilya Cherkasov on 20.02.2022.
//

import UIKit
import ObjectStorageKit

class ViewController: UIViewController {
    
    let url = URL(string: "https://storage.yandexcloud.net/ilya-cherkasov/simpleJSON")!
    
    lazy var objectStorage = ObjectStorage<SimpleJSON>(url: url)
    lazy var observer = objectStorage.getObserver()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        observer.onCompleted = { simpleJson in
            print(simpleJson.value)
        }
        observer.onError = { error in
            print(error.localizedDescription)
        }
    }


}

struct SimpleJSON: Codable {
    
    var value: Int
    
}
