//
//  SignInViewController.swift
//  Spot
//
//  Created by ARUNDAS PS on 2019-11-27.
//  Copyright © 2019 ARUNDAS PS. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    
    @IBOutlet weak var EmailEntered: UITextField!
    
    @IBOutlet weak var PasswordEntered: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func SignInClick(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: EmailEntered.text!, password: PasswordEntered.text!) { (user, error) in
        if error == nil{
         
         
         
     self.performSegue(withIdentifier: "TabView", sender: self)
         
//        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "TabView") as! MainTabController
//       self.navigationController?.pushViewController(vc1, animated: true)
//       self.present(vc1, animated: true, completion: nil)

                       }
         else{
          let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
          let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                         
           alertController.addAction(defaultAction)
           self.present(alertController, animated: true, completion: nil)
              }
        
        
        
    }
    
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
