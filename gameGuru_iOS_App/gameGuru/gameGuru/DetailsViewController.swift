//
//  DetailsViewController.swift
//  gameGuru
//
//  Created by Aiman Abdullah Anees on 10/03/18.
//  Copyright © 2018 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
class DetailsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var game_name: UILabel!
    @IBOutlet weak var game_name_view: UIVisualEffectView!
    @IBOutlet weak var gameVideo: UIWebView!
    @IBOutlet weak var game_details_view: UIVisualEffectView!
    @IBOutlet weak var game_description_view: UIVisualEffectView!
    @IBOutlet weak var game_image: UIImageView!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var developer: UILabel!
    @IBOutlet weak var game_description: UILabel!
    @IBOutlet weak var game_genre: UILabel!
    @IBOutlet weak var backButton: UIButton!
    var imageArray = [UIImage(named: ScanViewController.Game_Selected.game_support_image_1),UIImage(named:ScanViewController.Game_Selected.game_support_image_2 ),UIImage(named: ScanViewController.Game_Selected.game_support_image_3)]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GAME_NAME
        //Round Corners
        game_name_view.layer.cornerRadius = 3
        game_name_view.clipsToBounds=true
        //Shadows
        game_name_view.layer.cornerRadius = 3
        game_name_view.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        game_name_view.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        game_name_view.layer.shadowRadius = 1.7
        game_name_view.layer.shadowOpacity = 0.45
        
        //GAME_DETAILS
        //Round Corners
        game_details_view.layer.cornerRadius = 3
        game_details_view.clipsToBounds=true
        //Shadows
        game_details_view.layer.cornerRadius = 3
        game_details_view.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        game_details_view.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        game_details_view.layer.shadowRadius = 1.7
        game_details_view.layer.shadowOpacity = 0.45
        
        //GAME_VIDEO
        //Round Corners
        gameVideo.layer.cornerRadius = 3
        gameVideo.clipsToBounds=true
        //Shadows
       gameVideo.layer.cornerRadius = 3
       gameVideo.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        gameVideo.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        gameVideo.layer.shadowRadius = 1.7
        gameVideo.layer.shadowOpacity = 0.45
        
        //GAME_DESCRIPTION
        //Round Corners
        game_description_view.layer.cornerRadius = 3
        game_description_view.clipsToBounds=true
        //Shadows
        game_description_view.layer.cornerRadius = 3
        game_description_view.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        game_description_view.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        game_description_view.layer.shadowRadius = 1.7
        game_description_view.layer.shadowOpacity = 0.45
        
        //BACK_BUTTON
        //Round Corners
        backButton.layer.cornerRadius = 3
        backButton.clipsToBounds=true
        //Shadows
        backButton.layer.cornerRadius = 3
        backButton.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        backButton.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        backButton.layer.shadowRadius = 1.7
        backButton.layer.shadowOpacity = 0.45
        
        
        
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
