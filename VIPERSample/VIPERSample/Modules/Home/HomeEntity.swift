//
//  HomeEntity.swift
//  VIPERSample
//
//  Created by Vemireddy Vijayasimha Reddy on 07/04/24.
//

import Foundation
struct HomeModel: Decodable {
    var universityName: String
    var countryName: String
    var web_pages: [String]

//    init(data: [String: Any]) {
//        universityName = data["name"] as? String ?? ""
//        countryName = data["country"] as? String ?? ""
//        web_pages = data["web_pages"] as? [String] ?? []
//    }
    enum CodingKeys: String, CodingKey {
        
        case universityName = "name"
        case countryName = "country"
        case web_pages
    }
}
