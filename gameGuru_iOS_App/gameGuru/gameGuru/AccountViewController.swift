//
//  AccountViewController.swift
//  gameGuru
//
//  Created by Aiman Abdullah Anees on 03/03/18.
//  Copyright © 2018 Aiman Abdullah Anees. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.loadGif(name: "dog")
        if(LoginViewController.GlobalVariable_User_Sign_in.email != ""){
            name.text=LoginViewController.GlobalVariable_User_Sign_in.name
            email.text=LoginViewController.GlobalVariable_User_Sign_in.email
        }
        else{
            name.text=RegisterViewController.GlobalVariable_User_Sign_Up.name
            email.text=RegisterViewController.GlobalVariable_User_Sign_Up.email
        }
    }

   

}
