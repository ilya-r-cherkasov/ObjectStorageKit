//
//  ViewController.swift
//  ObjectStorageKitDemo
//
//  Created by Ilya Cherkasov on 20.02.2022.
//

import UIKit
import ObjectStorageKit

class ViewController: UIViewController {
    
    let objectStorage = ObjectStorage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectStorage.loadData()
    }


}

