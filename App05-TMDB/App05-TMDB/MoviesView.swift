//
//  ContentView.swift
//  App 05 Movies
//
//  Created by Carlos Astengo Macias on 27/09/21.
//

import SwiftUI
import Kingfisher

struct MoviesView: View {
    
    @StateObject var mediaModel: MediaModel
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(mediaModel.moviesNowPlaying) { movie in
                        NavigationLink(destination: MediaDetailView(mediaModel: mediaModel, media: movie, isMovie: true)) {
                            MediaRowView(media: movie, width: geo.size.width)
                        }
                    }
                }
            }
            .navigationBarTitle("Movies", displayMode: .inline)
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(mediaModel: MediaModel())
    }
}
