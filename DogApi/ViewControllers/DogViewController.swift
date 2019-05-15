//
//  DogViewController.swift
//  DogApi
//
//  Created by Jordan Hendrickson on 5/15/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import UIKit

class DogViewController: UIViewController {
    
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        DogController.shared.fetchDog(randomButton: sender as! UIButton) { (dog) in
            guard let dog = dog else {return}
            DogController.shared.fetchImageFor(dog: dog, completion: { (image) in
                guard let image = image else {return}
                
                self.updateViews(dog: dog, dogPicture: image)
            })
        }
        
    }
    
    func updateViews(dog: Dog, dogPicture: UIImage) {
        DispatchQueue.main.async {
//            self.nameLabel.text = "\(dog.name)"
            self.pictureImageView.image = dogPicture
        }
    }
    
 
}//end of class


