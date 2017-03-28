//
//  LoginViewController.swift
//  FirebaseWithLove
//
//  Created by Juan Antonio Martin Noguera on 29/03/2017.
//  Copyright © 2017 COM. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    var handle: FIRAuthStateDidChangeListenerHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handle = FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
            print("El mail del usuario logado es \(user?.email)")
        })
        
    }
    
    
    @IBAction func doLogin(_ sender: Any) {
        showUserLoginDialog(withCommand: login, userAction: .toLogin)
    }

    fileprivate func login(_ name: String, andPass pass: String) {
        FIRAuth.auth()?.signIn(withEmail: name, password: pass, completion: { (
            user, error) in
            
            if let _ = error {
                print("tenemos un error -> \(error?.localizedDescription)")
                FIRAuth.auth()?.createUser(withEmail: name, password: pass, completion: { (user, error) in
                    if let _ = error {
                        print("tenemos un error -> \(error?.localizedDescription)")
                        return
                    }
                    
                    print("\(user)")
                })
                
                
                return
            }
            print("user: \(user?.email!)")
            
        })
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    enum ActionUser: String {
        case toLogin = "Login"
        case toSignIn = "Registrar nuevo usuario"
    }
// MARK: Metodo para capturar los credenciales del usuario
    typealias actionUserCmd = (_ : String, _ : String) -> Void
    func showUserLoginDialog(withCommand actionCmd: @escaping actionUserCmd, userAction: ActionUser) {
    
        let alertController = UIAlertController(title: "FirebaseWithLove", message: userAction.rawValue,
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: userAction.rawValue,
                                                style: .default, handler: { (action) in
                                                    let eMailtxt = (alertController.textFields?[0])! as UITextField
                                                    let passTxt = (alertController.textFields?[1])! as UITextField
           
                                                    if (eMailtxt.text?.isEmpty)!, (passTxt.text?.isEmpty)! {
                                                        // No continuar y lanzar error
                                                    } else {
                                                        
                                                        actionCmd(eMailtxt.text!,
                                                                  passTxt.text!)
                                                    }
                                                    
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            
        }))
        
        alertController.addTextField { (txtField) in
            txtField.placeholder = "por favor escriba su email"
            txtField.textAlignment = .natural
        }
        
        alertController.addTextField { (txtField) in
            txtField.placeholder = "su password"
            txtField.textAlignment = .natural
            txtField.isSecureTextEntry = true
        }
        
        self.present(alertController, animated: true, completion: nil)
    
    }
    

}


















