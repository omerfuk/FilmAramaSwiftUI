//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Ömer Faruk Kılıçaslan on 24.07.2022.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId: String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack{
            
            OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.6, height: 300)
                .padding()
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film ismi Gösterilecek")
                .padding()
                .foregroundColor(.blue)
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek")
                .padding()
                .foregroundColor(.orange)
            
            Text("Yönetmen : \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen Gösterilecek")")
                .padding()
                .foregroundColor(.green)
            
            Text("Ödüller : \(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller Gösterilecek")")
                .padding()
            
        }
        .onAppear {
            filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        }
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "test")
    }
}
