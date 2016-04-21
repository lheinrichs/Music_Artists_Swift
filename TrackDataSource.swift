//
//  TrackDataSource.swift
//  ArtistsInTableView
//
//  Created by student on 4/20/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class TrackDataSource: NSObject {

    var tracks: [AnyObject]
    
    init(dataSource: [AnyObject], album_id:Int) {
        tracks = dataSource.filter({$0["album_id"] as! Int == album_id})
        super.init()
    }
    
    func numTracks() -> Int{
        return tracks.count
    }
    
    func trackAt(index: Int) -> Track {
        let track = Track( track: tracks[index] )
        return track
    }
}
