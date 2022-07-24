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
        
        List(filmListeViewModel.filmler, id: \.imdbId) { film in
            
            Text(film.title)
            
        }
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       FilmListeView()
    }
}
