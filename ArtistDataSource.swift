//
//  ArtistDataSource.swift
//  Navigation
//
//  Created by AAK on 3/11/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class ArtistDataSource: NSObject {
    
    var artists: [AnyObject]

    init(dataSource: [AnyObject]) {
        artists = dataSource
        super.init()
    }
    
    func numArtists() -> Int{
        return artists.count
    }
    
    func artistAt(index: Int) -> Artist {
        let artist = Artist( artist: artists[index] )
        return artist        
    }
    
}
