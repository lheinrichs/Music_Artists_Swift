//
//  TracksTableViewController.swift
//  ArtistsInTableView
//
//  Created by Lauren Heinrichs on 4/20/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class TracksTableViewController: UITableViewController {

    var tracksDS: TrackDataSource?
    var downloadTracks = Download(withURLString: "http://kooshesh.cs.sonoma.edu/cs470/tracks_human_readable.json")
    var AlbumId: Int = 0;
    
    deinit {
        downloadTracks.removeObserver(self, forKeyPath: "tracksFromServer", context: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadTracks.addObserver(self, forKeyPath: "tracksFromServer", options: .Old, context: nil)
        downloadTracks.download_request()
        title = "Tracks"
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        
        tracksDS = TrackDataSource(dataSource: downloadTracks.tracksFromServer!, album_id: AlbumId)
        
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let trs = tracksDS {
            return trs.numTracks()
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TrackCell", forIndexPath: indexPath)
        
        if let theCell = cell as? TrackTableViewCell, let n = tracksDS?.trackAt(indexPath.row) {
            theCell.useTrack(n)
        }
        

        
        return cell
    }
    
    func tracksForAlbum(AlbumId: Int) {
        self.AlbumId = AlbumId;
    }
    
    
    

    
}
