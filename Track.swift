//
//  Track.swift
//  ArtistsInTableView
//
//  Created by Lauren Heinrichs on 4/20/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class Track: NSObject {
    
    var track: AnyObject
    
    
    init(track: AnyObject) {
        self.track = track
        super.init()
      
    }
    
    func trackName() -> String? {
        
        if let a = track["title"] {
            return a as? String
            
        }
        return nil
        
    }
    
    func albumId() -> Int? {
        if let id = track["album_id"] {
            return id as? Int
        }
        return nil
    }


}
