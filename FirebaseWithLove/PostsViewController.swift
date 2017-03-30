//
//  PostsViewController.swift
//  FirebaseWithLove
//
//  Created by Juan Antonio Martin Noguera on 30/03/2017.
//  Copyright © 2017 COM. All rights reserved.
//

import UIKit

import Firebase
//import FirebaseDatabase


class PostsViewController: UIViewController {

    @IBOutlet weak var winnerLbl: UILabel!
    
    let ligaRef = FIRDatabase.database().reference().child("LigaWin")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ligaRef.observe(FIRDataEventType.value, with: { (snap) in
        
            print(snap)
            self.winnerLbl.text = snap.description
            
        }) { (error) in
            print(error)
        }
        
        
//        myRef.observe(FIRDataEventType.value) { (snap) in
        
//            winnerLbl.text = snap.value.descrition
//        }
        
    }
    

    @IBAction func madridAction(_ sender: Any) {
        ligaRef.setValue("Madrid")
    }

    @IBAction func barcaAction(_ sender: Any) {
        ligaRef.setValue("Barcelona")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
