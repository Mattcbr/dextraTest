//
//  ViewController.swift
//  dextraTest
//
//  Created by Matheus Queiroz on 4/18/18.
//  Copyright © 2018 mattcbr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let r =  Request()
        r.requestInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

