//
//  CatViewController.swift
//  DogApi
//
//  Created by Jordan Hendrickson on 5/15/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import UIKit

class CatViewController: UIViewController {
    
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func toDogsButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        CatController.shared.fetchCat(randomButton: sender as! UIButton) { (cat) in
            CatController.shared.fetchImageFor(cat: cat[0], completion: { (image) in
                guard let image = image else {return}
            self.updateViews(cat: cat[0], catPicture: image)
            })
        }
    }
    func updateViews(cat: Cat, catPicture: UIImage){
        DispatchQueue.main.async {
            self.catImageView.image = catPicture
        }
    }

}
