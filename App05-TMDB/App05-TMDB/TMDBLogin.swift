//
//  ContentView.swift
//  App 05 Movies
//
//  Created by Carlos Astengo Macias on 27/09/21.
//

import Foundation

let apikey = "af0bdba443d2089b3af4fd0fef10736f"
let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZjBiZGJhNDQzZDIwODliM2FmNGZkMGZlZjEwNzM2ZiIsInN1YiI6IjYxNTFkNzAwYWY5NTkwMDA0MzA3ZTVlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BiJCGTysRUNEAlIHkJJq31LJxtjiKxYpzdurV75cwpk"
let headers = [
    "Authorization": "Bearer \(apiauth)",
    "Accept": "application/json",
    "Content-Type": "application/json" ]

let tmdbURL = "https://api.themoviedb.org/3/"
let imageURL = "https://image.tmdb.org/t/p/original"
let youtubeURL = "https://youtu.be/"
