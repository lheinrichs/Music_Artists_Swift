//
//  Album.swift
//  ArtistsInTableView
//
//  Created by Lauren Heinrichs on 4/8/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class Album: NSObject {
    
    let album: AnyObject
    
    init(album: AnyObject) {
        self.album = album
        super.init()
    }
    
    func albumName() -> String? {
        
        if let a = album["title"] {
            return a as? String
        
        }
        return nil
        
    }
    
    func artistId() -> Int? {
        if let id = album["artist_id"] {
            return id as? Int
        }
        return nil
    }
    
    func albumId() -> Int? {
        if let id = album["album_id"] {
            return id as? Int
        }
        return nil
    }
    

}
