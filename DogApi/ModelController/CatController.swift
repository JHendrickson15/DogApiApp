//
//  CatController.swift
//  DogApi
//
//  Created by Jordan Hendrickson on 5/15/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import UIKit
class CatController {
    
    static let shared = CatController()
    
    func fetchCat(randomButton: UIButton, completion: @escaping ([Cat])-> Void){
        
        guard let baseURL = URL(string: "https://api.thecatapi.com/v1/images/search") else {return}
        
        var request = URLRequest(url: baseURL)
        request.setValue("x-api-key", forHTTPHeaderField: "efeec971-f0f8-400f-96c1-c0fb10e1c44f")

        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print(error)
            }
            if let data = data {
                do{
                    let cat = try JSONDecoder().decode([Cat].self, from: data)
                    completion(cat)
                }catch{
                    print("Oh no there was an error fetching cute cat pics!")
                    completion([]);return
                }
            }
        }.resume()
    }
    
    func fetchImageFor(cat: Cat, completion: @escaping (UIImage?)->Void) {
        
        let baseURL = cat.image
        
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {completion(nil);return}
            let image = UIImage(data: data)
            completion(image)
        }
        dataTask.resume()
    }
}//end of class
