//
//  InviteViewController.swift
//  Spot
//
//  Created by ARUNDAS PS on 2019-12-04.
//  Copyright © 2019 ARUNDAS PS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class InviteViewController: UIViewController {

    var d_reference :DatabaseReference!
    
    
    @IBOutlet weak var invite_username: UILabel!
    
    
    @IBOutlet weak var share: UIButton!
    
    @IBOutlet weak var usernameEntered: UITextField!
    
    
    @IBOutlet weak var AddFriend: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            d_reference = Database.database().reference().child("Users")
        
    }
    

    @IBAction func ShareAction(_ sender: Any) {
        
        let items = [invite_username.text]
        let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
        present(ac, animated: true)
    }
    
    
    @IBAction func AddAction(_ sender: Any) {
        
        let  UserEntered = usernameEntered.text
        let userId =  Auth.auth().currentUser?.uid
       // print(userId)
        
         
            // d_reference.child(userId).setValue.child
        
        
        
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


