//
//  ContentView.swift
//  App 05 Movies
//
//  Created by Carlos Astengo Macias on 27/09/21.
//

import SwiftUI

struct TMDBView: View {
    
    @StateObject var mediaModel = MediaModel()
    
    var body: some View {
        TabView {
            NavigationView {
                MoviesView(mediaModel: mediaModel)
            }
            .tabItem {
                Label("Movies", systemImage: "film.fill")
            }
            
            NavigationView {
                TabView {
                    SeriesView(mediaModel: mediaModel)
                }
            }
            .tabItem {
                Label("Series", systemImage: "tv.fill")
            }
        }
    }
}


struct TMDBView_Previews: PreviewProvider {
    static var previews: some View {
        TMDBView()
    }
}
