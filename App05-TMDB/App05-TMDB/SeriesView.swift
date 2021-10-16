//
//  ContentView.swift
//  App 05 Movies
//
//  Created by Carlos Astengo Macias on 27/09/21.
//

import SwiftUI
import Kingfisher

struct SeriesView: View {
    
    @StateObject var mediaModel: MediaModel
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(mediaModel.seriesNowPlaying) { serie in
                        NavigationLink(destination: MediaDetailView(mediaModel: mediaModel, media: serie, isMovie: false)) {
                            MediaRowView(media: serie, width: geo.size.width)
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Series", displayMode: .inline)
        }
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(mediaModel: MediaModel())
    }
}
