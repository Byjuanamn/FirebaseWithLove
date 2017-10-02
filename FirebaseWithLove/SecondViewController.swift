//
//  SecondViewController.swift
//  FirebaseWithLove
//
//  Created by Juan Antonio Martin Noguera on 28/03/2017.
//  Copyright © 2017 COM. All rights reserved.
//

import UIKit
import Firebase


class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Analytics.setScreenName("SecondViewController",
                                   screenClass: "Second")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
                
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func evento3Action(_ sender: Any) {
        Analytics.logEvent("Action3",
                              parameters: ["producto_desc" : "Manzanas" as NSObject])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
