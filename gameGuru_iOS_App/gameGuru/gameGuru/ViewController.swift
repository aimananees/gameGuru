//
//  ViewController.swift
//  gameGuru
//
//  Created by Aiman Abdullah Anees on 18/02/18.
//  Copyright © 2018 Aiman Abdullah Anees. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homePageImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        homePageImage.loadGif(name: "source")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

