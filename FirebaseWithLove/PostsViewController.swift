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

    
    let postsRef = Database.database().reference().child("Posts").child("articulos")
    var model: [MyPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        postsRef.observe(DataEventType.childAdded, with: { (snap) in
            
            for myPostfb in snap.children {
                
                let myPost = MyPost(snap: myPostfb as? DataSnapshot)
                self.model.append(myPost)
                
            }
            
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
            
            
        }) { (error) in
            print(error)
        }
        
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addINFB(_ sender: Any) {
        
        addRecordinPosts()
    }
    
    func addRecordinPosts() {
        
        let key = postsRef.child("articulos").childByAutoId().key
        
        let posts = ["title" : "Soy Leyenda", "desc" : "Mis pensamientos del este maravilloso libro"]
        
        let recordInFB = ["\(key)" : posts]
        
        postsRef.child("articulos").updateChildValues(recordInFB)
        
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



//
//  MyPost.swift
//
//
//  Created by Juan Antonio Martin Noguera on 31/03/2017.
//
//

class MyPost: NSObject {
    
    var title : String
    var desc : String
    var refInCloud: DatabaseReference?
    
    init(title: String, desc: String) {
        
        self.title = title
        self.desc = desc
        self.refInCloud = nil
        
    }
    
    init(snap: DataSnapshot?) {
        refInCloud = snap?.ref
        desc = "" //(snap?.value as? [String:Any])?["desc"] as! String
        title = "" //(snap?.value as? [String:Any])?["title"] as! String
        
        
    }
    
    convenience override init() {
        self.init(title: "", desc: "")
    }
    
    
}

