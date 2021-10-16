//
//  SerieRowView.swift
//  App05-TMDB
//
//  Created by Carlos Astengo Macias on 15/10/21.
//

import SwiftUI
import Kingfisher

struct SerieRowView: View {
    
    var media: Media
    var width: CGFloat
    
    var body: some View {
            VStack {
                KFImage(URL(string: "\(imageURL)\(media.poster)"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width-40)
                    .cornerRadius(40)
                    .overlay(
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                            VStack {
                                Spacer()
                                HStack {
                                    RateView(rate: media.rate * 10)
                                        .padding(.leading,35)
                                        .padding(.bottom,-35)
                                    Spacer()
                                }
                            }
                        }
                    )
                    .padding(.top,10)
                Text(media.title)
                    .font(.largeTitle)
                    .frame(width: width-40)
                    .multilineTextAlignment(.center)
                    .padding(.top,40)
                Text(media.releaseDate)
                    .font(.headline)
                    .padding(.top,0)
            }
            .padding(.horizontal,20)
            .onAppear {
                print("\(imageURL)\(media.poster)")
            }
    }
}

struct SerieRowView_Previews: PreviewProvider {
    static var previews: some View {
        SerieRowView(media: Media.dummy, width: 300.0)
    }
}
