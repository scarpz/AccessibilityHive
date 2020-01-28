//
//  MockService.swift
//  AccessibilityScarpz
//
//  Created by Felipe Scarpitta on 27/01/2020.
//  Copyright © 2020 scarpz. All rights reserved.
//

import Foundation

struct Artist {
    var name: String
    var latestAlbum: String
    var latestAlbumDate: Date
}


class MockService {
    
    static func getArtistInfos() -> [Artist] {
        
        var allArtist: [Artist] = []
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        let circaLastestReleaseDate = formatter.date(from: "11/24/2014")!
        allArtist.append(Artist(name: "Circa Survive", latestAlbum: "Descensus", latestAlbumDate: circaLastestReleaseDate))
        
        let fooFightersLastestReleaseDate = formatter.date(from: "09/15/2017")!
        allArtist.append(Artist(name: "Foo Fighters", latestAlbum: "Concrete And Gold", latestAlbumDate: fooFightersLastestReleaseDate))
        
        return allArtist
    }
}


