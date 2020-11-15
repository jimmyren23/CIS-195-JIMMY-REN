//
//  parkStruct.swift
//  NationalParks
//
//  Created by Jimmy Ren on 11/14/20.
//

import Foundation

struct APIResponse: Codable{
    let data: [Park]
}
struct Park: Codable{
    let name: String
    let description: String
    let designation: String
    let images: [Image]
}

struct Image: Codable {
    let url: String
}
