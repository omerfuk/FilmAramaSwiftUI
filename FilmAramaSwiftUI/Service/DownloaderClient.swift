//
//  DownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Ömer Faruk Kılıçaslan on 23.07.2022.
//

import Foundation

class DownloaderClient {
    
    func filmleriIndir(search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=e88eb61d") else{return completion(.failure(.yanlisURL))}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{return completion(.failure(.veriGelmedi))}
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilm.self, from: data) else {return completion(.failure(.veriIslenemedi))}
            
            completion(.success(filmCevabi.filmler))
            
        }
        .resume()
        
    }
    
    func filmDetayiniIndir(imdbId: String, completion: @escaping (Result<FilmDetay?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=e88eb61d") else{return completion(.failure(.yanlisURL))}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            
            guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetay.self, from: data) else{return completion(.failure(.veriIslenemedi))}
            
            completion(.success(gelenFilmDetayi))
            
        }
        .resume()
        
    }
    
}


enum DownloaderError: Error {
    
    case yanlisURL
    case veriGelmedi
    case veriIslenemedi
    
}
