//
//  AvailabilityViewController.swift
//  dextraTest
//
//  Created by Matheus Queiroz on 4/19/18.
//  Copyright © 2018 mattcbr. All rights reserved.
//

import UIKit

class AvailabilityViewController: UIViewController {

    var repo = Repositories(name: "", path: "")
    @IBOutlet weak var availabilityLabel: UILabel!
    @IBOutlet weak var openInTheNavigatorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let labelText = "\(repo.name)\n\nRepositório Disponível em:\n\(repo.path)"
        availabilityLabel.text = labelText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        if let url = NSURL(string:repo.path) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
}
