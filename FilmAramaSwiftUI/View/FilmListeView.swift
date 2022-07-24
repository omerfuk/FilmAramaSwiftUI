//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by Ömer Faruk Kılıçaslan on 23.07.2022.
//

import SwiftUI

struct FilmListeView: View {
    
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
        self.filmListeViewModel.filmAramasiYap(filmIsmi: "pulp")
    }
    
    var body: some View {
        
        NavigationView{
            List(filmListeViewModel.filmler, id: \.imdbId) { film in
                
                HStack{
                    OzelImage(url: film.poster)
                        .frame(width: 100, height: 150)
                        .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text(film.title)
                            .font(.title3)
                            .foregroundColor(.blue)
                        Text(film.year)
                            .foregroundColor(.orange)
                            .bold()
                    }
                }
                
            }
            .navigationTitle("Film Kitabı")
        }
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       FilmListeView()
    }
}
