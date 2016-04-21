//
//  Artist.swift
//  Navigation
//
//  Created by AAK on 3/11/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class Artist: NSObject {
    
    let artist: AnyObject

    init(artist: AnyObject) {
        self.artist = artist
        super.init()
    }
    
    func artistName() -> String? {
        if let a = artist["artist_name"] {
            return a as? String
        }
        return nil
    }
    
    func artistProfile() -> String? {
        if let a = artist["profile"] {
            return a as? String
        }
        return nil        
    }
    
    func artistId() -> Int? {
        if let id = artist["artist_id"] {
            return id as? Int
        }
        return nil
    }
    
    func getImage() ->UIImage? {
        if let uriString = artist["uri"], let uri = uriString as? String {
            if let url = NSURL(string: uri),
            data = NSData(contentsOfURL: url),
            image = UIImage(data: data) {
                return image
            }
        }
        return nil
    }
}
