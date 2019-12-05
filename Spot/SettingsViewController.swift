//
//  SettingsViewController.swift
//  Spot
//
//  Created by ARUNDAS PS on 2019-12-05.
//  Copyright © 2019 ARUNDAS PS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SettingsViewController: UIViewController {
 
    
    
    @IBOutlet weak var disp_name: UILabel!
    
    
    @IBOutlet weak var disp_email: UILabel!
    @IBOutlet weak var disp_username: UILabel!
    var RefUser : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     RefUser = Database.database().reference().child("Users")
        
        
        
        guard let userid =  Auth.auth().currentUser?.uid else {return}
        RefUser.child("Users").child(userid).observeSingleEvent(of: .value, with: {(snapshot) in
        
            
            
            guard let dict = snapshot.value as? [String: Any] else {return }
            
            let user = CurrentUser(uid: userid,dictionary: dict)
            
//            let name = value?["Name"] as? String ?? ""
//            let email = value?["UserEmail"] as? String ?? ""
//            let username = value?["Username"] as? String ?? ""
//
//
            self.disp_name.text = user.name
            self.disp_email.text = user.email
            self.disp_username.text = user.username
            
            print()
        // Do any additional setup after loading the view.
    })
        { (error) in
            print(error.localizedDescription)
        }
}
    
    
    @IBAction func LogOut(_ sender: Any) {
   
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            //AppState.sharedInstance.signedIn = false
            dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "Logout", sender: self)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError)")
        } catch {
            print("Unknown error.")
        }
    }
    
    }

