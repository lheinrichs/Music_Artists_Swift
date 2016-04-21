//
//  AlbumsTableViewController.swift
//  ArtistsInTableView
//
//  Created by Lauren Heinrichs on 4/8/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {

    
    var albumsDS: AlbumDataSource?
    var downloadAlbums = Download(withURLString: "http://kooshesh.cs.sonoma.edu/cs470/albums_human_readable.json")
    var ArtistId: Int = 0;
    
    deinit {
        downloadAlbums.removeObserver(self, forKeyPath: "albumsFromServer", context: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       downloadAlbums.addObserver(self, forKeyPath: "albumsFromServer", options: .Old, context: nil)
       downloadAlbums.download_request()
        title = "Albums"
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {

            
            albumsDS = AlbumDataSource(dataSource: downloadAlbums.albumsFromServer!, artist_id: ArtistId)
            
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
        }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let ads = albumsDS {
            return ads.numAlbums()
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AlbumCell", forIndexPath: indexPath)
        
        if let theCell = cell as? AlbumTableViewCell, let n = albumsDS?.albumAt(indexPath.row) {
            theCell.useAlbum(n)
        }
        
        
        
        return cell
    }
    
    func artistForAlbums(ArtistId: Int) {
        self.ArtistId = ArtistId;
    }

    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "TrackDetails" {
            
            //            if let row = tableView.indexPathForSelectedRow?.row {
            //                let album = albumsDS?.albumAt(row)
            //                let detailedVC = segue.destinationViewController as! AlbumDetailedViewController
            //                detailedVC.albumForThisView(album!)
            //            }
            
            // OR
            let cell = sender as! AlbumTableViewCell
            if let indexPath = tableView.indexPathForCell(cell), let ds = albumsDS {
                let detailedVC = segue.destinationViewController as! TracksTableViewController
                detailedVC.tracksForAlbum(ds.albumAt(indexPath.row).albumId()!)
            }
            
        }
        
        
    }
    
    
}


