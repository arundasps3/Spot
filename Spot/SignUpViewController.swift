//
//  SignUpViewController.swift
//  Spot
//
//  Created by ARUNDAS PS on 2019-11-27.
//  Copyright © 2019 ARUNDAS PS. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import Toast_Swift

class SignUpViewController:
UIViewController {

    
    var RefUser : DatabaseReference!
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Confirmpassword: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    
    @IBOutlet weak var SIgnUpButton: UIButton!
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        RefUser = Database.database().reference().child("Users")
        
        
        
    }
    
   
    @IBAction func SignUpClicked(_ sender: Any) {
        
        
               if Password.text != Confirmpassword.text {
               let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
               let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                           
               alertController.addAction(defaultAction)
               self.present(alertController, animated: true, completion: nil)
                       }
               else{
                
                
               Auth.auth().createUser(withEmail: Email.text!, password: Password.text!){ (user, error) in
                if error == nil {
                  
                    let UserDetails = Auth.auth().currentUser?.uid
                    let User =
                        ["id" : UserDetails,
                         "Name ": self.Name.text! as String,
                         "UserEmail" : self.Email.text! as String , "Username":self.Username.text! as String]
                    
                    self.RefUser.child(UserDetails!).setValue(User)
                    
                  self.performSegue(withIdentifier: "MainPage", sender: self)
                    
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainPage") as! ViewController
//                   self.navigationController?.pushViewController(vc, animated: true)
//                   self.present(vc, animated: true, completion: nil)
//
                    
                    
                    self.view.makeToast("Account Created successfully")

                               }
                else{
                   
                  let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                  let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                   
                   alertController.addAction(defaultAction)
                   self.present(alertController, animated: true, completion: nil)
                      }
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
