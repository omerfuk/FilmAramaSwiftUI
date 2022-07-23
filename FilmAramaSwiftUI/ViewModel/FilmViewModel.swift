//
//  FilmViewModel.swift
//  FilmAramaSwiftUI
//
//  Created by Ömer Faruk Kılıçaslan on 23.07.2022.
//

import Foundation
import SwiftUI

class FilmListeViewModel: ObservableObject {
    
    @Published var filmler = [Film]()
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi: String) {
        downloaderClient.filmleriIndir(search: filmIsmi) { sonuc in
            
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi
                    }
                }
            }
        }
    }
}
