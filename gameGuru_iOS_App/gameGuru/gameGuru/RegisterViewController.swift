//
//  RegisterViewController.swift
//  gameGuru
//
//  Created by Aiman Abdullah Anees on 01/03/18.
//  Copyright © 2018 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var re_password: UITextField!
    @IBOutlet weak var incorrect: UILabel!
    var EMAIL:String!
    var NAME:String!
    
    var databaseRef:FIRDatabaseReference!
    var databaseRef1:FIRDatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.loadGif(name: "dog")
        // Do any additional setup after loading the view.
        databaseRef=FIRDatabase.database().reference().child("user_info")
    }
    
    struct GlobalVariable_User_Sign_Up{
        static var name = String()
        static var email = String()
        
    }

    @IBAction func register(_ sender: UIButton) {
        if name.text != "" && email.text != "" && password.text == re_password.text{
            FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text! , completion:{(user,error) in
                
                if error == nil{
                   self.NAME=self.name.text
                   self.EMAIL=self.email.text
                
                let key=self.databaseRef.childByAutoId().key
                let post : [String : AnyObject] = ["email" : self.EMAIL as AnyObject,"name": self.NAME as AnyObject]
                self.databaseRef.child(key).setValue(post)
                    
                GlobalVariable_User_Sign_Up.name = self.NAME
                GlobalVariable_User_Sign_Up.email = self.EMAIL
                self.incorrect.text="Welcome \(self.name.text!)"
                print(self.incorrect.text!)
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ScanViewController") as! ScanViewController
                self.present(nextViewController, animated:true, completion:nil)
                }
                else{
                    self.incorrect.text=error?.localizedDescription
                    print(self.incorrect.text!)
                }
            })
        }
            
        else{
            if self.password.text != self.re_password.text{
                self.incorrect.text="Two passwords are not matching"
                print(self.incorrect.text)
                
            }
            else{self.incorrect.text="Some fields are missing"}
        }
    }

    

}
