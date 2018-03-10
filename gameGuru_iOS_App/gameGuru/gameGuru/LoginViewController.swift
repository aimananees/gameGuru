//
//  LoginViewController.swift
//  gameGuru
//
//  Created by Aiman Abdullah Anees on 01/03/18.
//  Copyright © 2018 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import Firebase

struct Firebasepull1{
    let name : String!
    let email : String!
    
}

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var incorrect: UILabel!
    
    var users = [Firebasepull1]()
    
    var ref:FIRDatabaseReference?
    var databaseHandle:FIRDatabaseHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.loadGif(name: "dog")
        
        ref = FIRDatabase.database().reference()
        databaseHandle=ref?.child("user_info").observe(.childAdded, with: {
            (snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                let name=dictionary["name"] as? String
                let email=dictionary["email"] as? String
                self.users.insert(Firebasepull1(name:name,email:email), at: 0)
            }
        }, withCancel:nil)
    }
    
    
    struct GlobalVariable_User_Sign_in{
        static var name = String()
        static var email = String()
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        if email.text != "" && password.text != ""{
            
            FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text!, completion: {(user,error) in
                
                if error == nil{
                    
                    var i:Int = 0
                    while(i<self.users.count){
                        if(self.users[i].email == self.email.text!){
                            GlobalVariable_User_Sign_in.name = self.users[i].name
                            GlobalVariable_User_Sign_in.email=self.users[i].email
                        }
                        i=i+1
                    }
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ScanViewController") as! ScanViewController
                    self.present(nextViewController, animated:true, completion:nil)
                }
                    
                else{
                    
                    self.incorrect.text=error?.localizedDescription
                    
                }
                
            })
            
        }
        else{
            self.incorrect.text = "Some fields are missing"
        }
        
    }
  
    

}
