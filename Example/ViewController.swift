//
//  ViewController.swift
//  Example
//
//  Created by Kazunori Kikuchi on 2017/11/26.
//  Copyright © 2017年 kazunori kikuchi. All rights reserved.
//

import UIKit
import Exif

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let exif = Exif(forResource: "sample", ofType: "jpg") {
            print(exif.properties)
        }
    }
}

