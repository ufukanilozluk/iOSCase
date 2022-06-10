//
//  Hava.swift
//  IosCase
//
//  Created by Ufuk Anıl Özlük on 4.12.2020.
//

import Foundation

struct Slider: Codable {
    var picture: String?
    

    init(json: [String: Any]) {
        picture = json["picture"] as? String ?? ""
       
    }
}

struct Kategori: Codable {
    var title: String?
    var picture: String?

    init(json: [String: Any]) {
        picture = json["picture"] as? String ?? ""
        title = json["title"] as? String ?? ""
    }
}

struct CokSatan: Codable {
    var title: String?
    var picture: String?

    init(json: [String: Any]) {
        picture = json["picture"] as? String ?? ""
        title = json["title"] as? String ?? ""
    }
}


struct Markalar: Codable {
    
    var picture: String?

    init(json: [String: Any]) {
        picture = json["picture"] as? String ?? ""
    }
}

