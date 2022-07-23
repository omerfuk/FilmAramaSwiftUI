//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by Ömer Faruk Kılıçaslan on 23.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            DownloaderClient().filmleriIndir(search: "pulp") { sonuc in
                switch sonuc {
                case .success(let filmDizisi):
                    print(filmDizisi)
                case .failure(let hata):
                    print(hata.localizedDescription)
                }
            }
        } label: {
            Text("Test Yap")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
