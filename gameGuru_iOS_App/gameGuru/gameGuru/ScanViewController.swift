//
//  ScanViewController.swift
//  gameGuru
//
//  Created by Aiman Abdullah Anees on 01/03/18.
//  Copyright © 2018 Aiman Abdullah Anees. All rights reserved.
//
/*
 Alamofire.request("https://1a5235fb.ngrok.io/sendURL/getGame").responseJSON { response in
 print(response.result)
 if let JSON = response.result.value as? AnyObject {
 print(JSON)
 self.GAME = JSON["game_name"] as! String
 }
 else
 {
 print("Error")
 }
 print("AAAAAAAAAAAAAAAAAAA")
 print(self.GAME)
 }
 */

import UIKit
import Alamofire
import Firebase
import FirebaseDatabase
import FirebaseStorage
import SVProgressHUD

struct Game_Classification{
    let game_name : String!
    let game_url : String!
    let game_description : String!
    let developer : String!
    let publisher : String!
    let game_genre : String!
    let game_image : String!
    let game_support_image_1 : String!
    let game_support_image_2 : String!
    let game_support_image_3 : String!
}



class ScanViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var capturePhotoView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var Url:AnyObject!
    var imageData:UIImage!
    var GAME:String!
    
    var games = [Game_Classification]()
    var ref:FIRDatabaseReference?
    var databaseHandle:FIRDatabaseHandle?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imageView.loadGif(name: "robot")
        ref = FIRDatabase.database().reference()
        databaseHandle=ref?.child("games").observe(.childAdded, with: {
            (snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                let game_name = dictionary["game_name"] as? String
                let game_url = dictionary["game_url"] as? String
                let game_description = dictionary["game_description"] as? String
                let developer = dictionary["developer"] as? String
                let publisher = dictionary["publisher"] as? String
                let game_genre = dictionary["game_genre"] as? String
                let game_image = dictionary["game_image"] as? String
                let game_support_image_1 = dictionary["game_support_image_1"] as? String
                let game_support_image_2 = dictionary["game_support_image_2"] as? String
                let game_support_image_3 = dictionary["game_support_image_3"] as? String
                self.games.insert(Game_Classification(game_name:game_name,game_url:game_url,game_description:game_description,developer:developer,publisher:publisher,game_genre:game_genre,game_image:game_image,game_support_image_1:game_support_image_1,game_support_image_2:game_support_image_2,game_support_image_3:game_support_image_3), at: 0)
            }
        }, withCancel:nil)
        
    }
    
    @IBAction func takePhoto(_ sender: UIButton) {
        imagePicker.sourceType=UIImagePickerControllerSourceType.camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    struct Game_Selected{
        static var game_name = String()
        static var game_url = String()
        static var game_description = String()
        static var developer = String()
        static var publisher = String()
        static var game_genre = String()
        static var game_image = String()
        static var game_support_image_1 = String()
        static var game_support_image_2 = String()
        static var game_support_image_3 = String()
    }
    
    
    
    func uploadImageToFirebaseStorage(data:NSData){
        SVProgressHUD.show(withStatus: "Loading")
        UIApplication.shared.beginIgnoringInteractionEvents()
        var Timestamp: String {
            return "\(NSDate().timeIntervalSince1970 * 1000)"
        }
        DispatchQueue.global(qos:.background).async {
            let storageRef = FIRStorage.storage().reference(withPath: "\(Timestamp)")
            let uploadMetadata = FIRStorageMetadata()
            uploadMetadata.contentType = "image/jpeg"
            let uploadTask = storageRef.put(data as Data, metadata: uploadMetadata) {
                (metadata,error) in
                if(error != nil){
                    print(error?.localizedDescription)
                }
                else{
                    print(metadata)
                    let Url:URL = (metadata?.downloadURL())!
                    do{
                        print(Url)
                        var url_string:String = "\(Url)"
                        self.Url = url_string as AnyObject!
                        print(self.Url)
                        let parameters = [
                            "url": self.Url
                        ]
                        //POST Request
                        let url = "https://284df71b.ngrok.io/sendURL/getGame"
                        Alamofire.request(url, method:.post, parameters:parameters,encoding: JSONEncoding.default).responseJSON { response in
                            switch response.result {
                            case .success:
                                print(response)
                            case .failure:
                                print("Error")
                            }
                        }
                        self.getRequest()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                            /*
                            self.dismiss(animated: true, completion: {
                                print("here dismissing")
                            })
                            */
                            SVProgressHUD.dismiss()
                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GameDetailsViewController") as! GameDetailsViewController
                            self.present(nextViewController, animated:true, completion:nil)
                            UIApplication.shared.endIgnoringInteractionEvents()
                        }
                    }
                        
                    catch{
                        print("Error")
                    }
                }
            }
            uploadTask.observe(.progress) {[weak self] (snapshot) in
                guard let strongSelf = self else { return }
                guard let progress = snapshot.progress else{ return }
            }
        }
        
    }
    
    
    
    func getRequest(){
            Alamofire.request("https://284df71b.ngrok.io/sendURL/getGame").responseJSON { response in
                print(response.result)
                if let JSON = response.result.value as? AnyObject {
                    print(JSON)
                    self.GAME = JSON["game_name"] as! String
                    Game_Selected.game_name=JSON["game_name"] as! String
                    Game_Selected.game_url=JSON["game_url"] as! String
                    Game_Selected.game_description=JSON["game_description"] as! String
                    Game_Selected.developer=JSON["developer"] as! String
                    Game_Selected.publisher=JSON["publisher"] as! String
                    Game_Selected.game_genre=JSON["game_genre"] as! String
                    Game_Selected.game_image=JSON["game_image"] as! String
                    Game_Selected.game_support_image_1=JSON["game_support_image_1"] as! String
                    Game_Selected.game_support_image_2=JSON["game_support_image_2"] as! String
                    Game_Selected.game_support_image_3=JSON["game_support_image_3"] as! String
                }
                else
                {
                    print("Error")
                }
                print("AAAAAAAAAAAAAAAAAAA")
                print(Game_Selected.game_name)
               
                }
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        capturePhotoView.image=info[UIImagePickerControllerOriginalImage] as? UIImage
        imageData=capturePhotoView.image
        if let OriginalImage = info[UIImagePickerControllerOriginalImage] as? UIImage,
            let imageData=UIImageJPEGRepresentation(OriginalImage, 0.8){
            uploadImageToFirebaseStorage(data: imageData as NSData)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
