//
//  DogController.swift
//  DogApi
//
//  Created by Jordan Hendrickson on 5/15/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import UIKit
class DogController {
    //singleton
    static let shared = DogController()
    //crud functions
    func fetchDog(randomButton: UIButton, completion: @escaping (Dog?) -> Void){
        //build the url
        guard let baseURL = URL(string: "https://dog.ceo/api/breeds/image/random") else {return}
        //add components and query items
        //test the url
    
        //start data task
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                print("oh no there was an error \(error.localizedDescription)")
            }
            if let data = data {
                do{
                    let dog = try JSONDecoder().decode(Dog.self, from: data)
                    completion(dog)
                }catch{
                    print("Oh no there was an error fetching cute dog pics")
                    completion(nil);return
                }
            }
        }.resume()
    }
    
    func fetchImageFor(dog: Dog, completion: @escaping (UIImage?) -> Void) {
        
        let baseURL = dog.image
        
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                print("Whoopsie theres an error, \(error.localizedDescription)")
                return
    }
            guard let data = data else {completion(nil);return}
            let image = UIImage(data:data)
            completion(image)
        }
        dataTask.resume()
    }
}// end of class
