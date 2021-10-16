//
//  MediaModel.swift
//  App05-TMDB
//
//  Created by David Cantú Delgado on 27/09/21.
//

import SwiftUI
import Alamofire

class MediaModel: ObservableObject {
    
    @Published var genres = [Genre]()
    @Published var moviesNowPlaying = [Media]()
    @Published var seriesNowPlaying = [Media]()
    
    init() {
        loadGenres()
        loadMoviesNowPlaying()
        loadSeriesNowPlaying()
    }
    
    func loadGenres() {
        
        genres.removeAll()
        
        let URL = "\(tmdbURL)genre/movie/list?api_key=\(apikey)&language=en-US"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
            
            var genre: Genre
            
            for j in json["genres"] {
                
                genre = Genre(id: j.1["id"].intValue, name: j.1["name"].stringValue)
                self.genres.append(genre)
                
            }
            
        }
        
    }
    
    func loadMoviesNowPlaying() {
        
        genres.removeAll()
        
        let URL = "\(tmdbURL)movie/now_playing?api_key=\(apikey)&language=en-US&page=1"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
            
            var movie: Media
            
            for m in json["results"] {
                var genresIDs = [String]()
                for g in m.1["genre_ids"] {
                    if let index = self.genres.firstIndex(where: {$0.id == g.1.intValue }) {
                        genresIDs.append(self.genres[index].name)
                    }
                }
                movie = Media(id: m.1["id"].intValue,
                              title: m.1["title"].stringValue,
                              overview: m.1["overview"].stringValue,
                              poster: m.1["poster_path"].stringValue,
                              rate: m.1["vote_average"].doubleValue,
                              genres: genresIDs,
                              releaseDate: m.1["release_date"].stringValue)
                self.moviesNowPlaying.append(movie)
                
            }
            
        }
        
    }
    
    func loadSeriesNowPlaying() {
        seriesNowPlaying.removeAll()
        
        let URL = "\(tmdbURL)tv/popular?api_key=\(apikey)&language=en-US&page=1"
        
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
            
            var serie: Media
            
            for s in json["results"] {
                var genresIDs = [String]()
                for g in s.1["genre_ids"] {
                    if let index = self.genres.firstIndex(where: {$0.id == g.1.intValue }) {
                        genresIDs.append(self.genres[index].name)
                    }
                }
                serie = Media(id: s.1["id"].intValue,
                              title: s.1["name"].stringValue,
                              overview: s.1["overview"].stringValue,
                              poster: s.1["poster_path"].stringValue,
                              rate: s.1["vote_average"].doubleValue,
                              genres: genresIDs,
                              releaseDate: s.1["first_air_date"].stringValue)
                self.seriesNowPlaying.append(serie)
                
            }
            
        }
    }
    
    func loadMoviePosters(id: Int, handler: @escaping(_ returnedImages: [String]) ->()) {
        
        let URL = "https://api.themoviedb.org/3/movie/\(id)/images?api_key=\(apikey)"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
            
            var images = [String]()
            
            for image in json["posters"] {
                
                if image.1["width"].intValue == 2000 && image.1["iso_639_1"].stringValue == "en" {
                    images.append(image.1["file_path"].stringValue)
                }
                
            }
            
            handler(images)
            
        }
        
    }

    func loadMovieTrailers(id: Int, handler: @escaping(_ returnedTrailers: [Trailer]) ->()) {
        
        let URL = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(apikey)&language=en-US"

        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
            
            var trailers = [Trailer]()
            var trailer: Trailer
            
            for t in json["results"] {
                
                trailer = Trailer(id: t.1["id"].stringValue,
                                  name: t.1["name"].stringValue,
                                  key: t.1["key"].stringValue,
                                  type: t.1["type"].stringValue)
                trailers.append(trailer)
                
                
            }
            
            trailers.sort { $0.type > $1.type }
            
            handler(trailers)
            
        }
        
    }

    
    
}
