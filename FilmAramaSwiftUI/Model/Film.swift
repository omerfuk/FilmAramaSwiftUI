//
//  Film.swift
//  FilmAramaSwiftUI
//
//  Created by Ömer Faruk Kılıçaslan on 23.07.2022.
//

import SwiftUI


struct GelenFilm : Codable{
    
    let filmler: [Film]
    
    private enum CodingKeys: String, CodingKey {
        case filmler = "Search"
    }
    
}

struct Film : Codable{
    
    let title: String
    let year: String
    let imdbId: String
    let type: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year  = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
