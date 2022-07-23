//
//  DownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Ömer Faruk Kılıçaslan on 23.07.2022.
//

import Foundation

class DownloaderClient {
    
    func filmleriIndir(search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=titanic&apikey=e88eb61d") else{return completion(.failure(.yanlisURL))}
        
    }
    
}


enum DownloaderError: Error {
    
    case yanlisURL
    case veriGelmedi
    case veriIslenemedi
    
}
