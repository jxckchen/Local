//
//  HomeViewController.swift
//  Local
//
//  Created by Jack Chen on 12/17/18.
//  Copyright © 2018 Jack Chen. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class HomeViewController: UIViewController{

    @IBOutlet weak var barThing: UITabBarItem!
    var imagePicker:UIImagePickerController!
    @IBOutlet weak var profileImagePicker: UIImageView!
    
    override func viewDidLoad() {
        barThing.title = nil
        barThing.imageInsets = UIEdgeInsets(top: 6,left:0,bottom: -6,right: 0)
        setBackgroundGrey()
        self.tabBarController?.tabBar.barTintColor = UIColor.black
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImagePicker.isUserInteractionEnabled = true
        profileImagePicker.addGestureRecognizer(imageTap)
        profileImagePicker.layer.cornerRadius = profileImagePicker.bounds.height/2
        profileImagePicker.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }
    
    @objc func openImagePicker(_ sender:Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func logout(_ sender: Any) {
        let alertController = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        self.present(alertController, animated: true, completion: nil)
        let logoutAction = UIAlertAction(title: "Sign out", style: .default, handler: {(_: UIAlertAction!) in
            self.logoutFunction()
        })
        alertController.addAction(defaultAction)
        alertController.addAction(logoutAction)
    }
    
    func logoutFunction() {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
    }
    
    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:String?)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        guard let imageData = UIImage.jpegData() else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "img/jpg"
        
        storageRef.putData(imageData, metadata: metaData) {metaData, error in
            if error == nil, metaData != nil {
                if let url = metaData?.downloadURL()?.absoluteString {
                    completion(url)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
    
}



extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profileImagePicker.image = pickedImage
            self.uploadProfileImage(<#T##image: UIImage##UIImage#>, completion: <#T##((String?) -> ())##((String?) -> ())##(String?) -> ()#>)
            
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}
