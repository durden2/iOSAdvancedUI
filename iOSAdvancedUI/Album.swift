//
//  Album.swift
//  iOSAdvancedUI
//
//  Created by Michal on 11/11/16.
//  Copyright © 2016 Michal. All rights reserved.
//
import UIKit

class Album {
    var albumName: String? = "unknown";
    var artistName: String? = "unknown";
    var date: String? = "2011";
    var genre: String? = "pop";
    var rating: Int? = 1;
    var photoImage: UIImage = UIImage(named: "Image")!;
    var index: Int? = 0;
    
    init(artist: String?, album: String?, date: String?, genre: String?, rating: Int? = 0, photo: UIImage = UIImage(named: "Image")!, number: Int? = 0) {
        self.artistName = artist;
        self.albumName = album;
        self.photoImage = photo;
        self.date = date;
        self.genre = genre;
        self.rating = rating;
        self.index = number;
    }
}
