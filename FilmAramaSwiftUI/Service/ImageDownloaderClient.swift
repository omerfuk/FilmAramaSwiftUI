//
//  ImageDownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Ömer Faruk Kılıçaslan on 24.07.2022.
//

import Foundation

class ImageDownloaderClient: ObservableObject {
    
    @Published var indirilenGorsel: Data?
    
    func gorselIndir(url: String) {
        
        guard let imageUrl = URL(string: url) else{return}
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            
            guard let data = data, error == nil else{return}
            //Data geldi
            
            DispatchQueue.main.async {
                self.indirilenGorsel = data
            }
        }
        .resume()
        
    }
}
