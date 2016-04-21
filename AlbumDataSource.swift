//
//  AlbumDataSource.swift
//  ArtistsInTableView
//
//  Created by Lauren Heinrichs on 4/8/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class AlbumDataSource: NSObject {
    

    var albums: [AnyObject]
    
    init(dataSource: [AnyObject], artist_id:Int) {
        albums = dataSource.filter({$0["artist_id"] as! Int == artist_id})
        super.init()
    }
    
    func numAlbums() -> Int{
        return albums.count
    }
    
    func albumAt(index: Int) -> Album {
        let album = Album( album: albums[index] )
        return album
    }
}
