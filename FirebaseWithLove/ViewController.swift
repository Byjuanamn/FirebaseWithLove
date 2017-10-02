//
//  ViewController.swift
//  FirebaseWithLove
//
//  Created by Juan Antonio Martin Noguera on 28/03/2017.
//  Copyright © 2017 COM. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Analytics.setScreenName("MainViewController", screenClass: "Main")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func evento1Action(_ sender: Any) {
        Analytics.logEvent("Action1",
                              parameters: ["producto" : "Manzanas" as NSObject, "cantidad" : "20" as NSObject])
    }

    @IBAction func evento2Action(_ sender: Any) {
        Analytics.logEvent("Action2", parameters: ["Cesta": 25 as NSObject])
        
    }
}

