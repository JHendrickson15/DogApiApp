//
//  Cat.swift
//  DogApi
//
//  Created by Jordan Hendrickson on 5/15/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import Foundation

struct Cat: Decodable {
    let image: URL
    private enum CodingKeys: String, CodingKey {
        case image = "url"
    }
}
