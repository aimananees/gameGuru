//
//  GameDetailsViewController.swift
//  gameGuru
//
//  Created by Aiman Abdullah Anees on 05/03/18.
//  Copyright © 2018 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import Alamofire
import Firebase
import FirebaseDatabase
import FirebaseStorage

class GameDetailsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    

    var imageArray = [UIImage(named: ScanViewController.Game_Selected.game_support_image_1),UIImage(named:ScanViewController.Game_Selected.game_support_image_2 ),UIImage(named: ScanViewController.Game_Selected.game_support_image_3)]
 
    @IBOutlet weak var game_image: UIImageView!
    @IBOutlet weak var game_genre: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var developer: UILabel!
    @IBOutlet weak var game_name: UILabel!
    @IBOutlet weak var game_description: UILabel!
    @IBOutlet weak var gameVideo: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        getVideo(videoURL: ScanViewController.Game_Selected.game_url)
        game_genre.text = ScanViewController.Game_Selected.game_genre
        publisher.text=ScanViewController.Game_Selected.publisher
        developer.text=ScanViewController.Game_Selected.developer
        game_name.text=ScanViewController.Game_Selected.game_name
        game_description.text=ScanViewController.Game_Selected.game_description
        game_image.image=UIImage(named:ScanViewController.Game_Selected.game_image)

 
    }
    
    func getVideo(videoURL:String){
        if videoURL != ""{
            let url = URL(string:videoURL)
            gameVideo.loadRequest(URLRequest(url: url!))
        }
        else{
            print("Error")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImagesCollectionViewCell
        
        cell.imgImage.image = imageArray[indexPath.row]
        return cell
        
    }

    
}

