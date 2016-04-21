//
//  ArtistsTableViewController.swift
//  ArtistsInTableView
//
//  Created by AAK on 3/11/16.
//  Modified by Lauren Heinrichs
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class ArtistsTableViewController: UITableViewController {
    
    
    
    var artistsDS: ArtistDataSource?
    var albumsDS: AlbumDataSource?
    var downloadAssistant = Download(withURLString: "https://www.cs.sonoma.edu/~kooshesh/cs470/artists.json")
    
    
    deinit {
        downloadAssistant.removeObserver(self, forKeyPath: "dataFromServer", context: nil)
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()

        downloadAssistant.addObserver(self, forKeyPath: "dataFromServer", options: .Old, context: nil)
        downloadAssistant.download_request()
        title = "Artists"
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        artistsDS = ArtistDataSource(dataSource: downloadAssistant.dataFromServer!)
        
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let ads = artistsDS {
            return ads.numArtists()
        }
        return 0
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ArtistCell", forIndexPath: indexPath)

        if let theCell = cell as? ArtistTableViewCell, let n = artistsDS?.artistAt(indexPath.row) {
            theCell.useArtist(n)
        }

        

        
        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowAlbums" {
            
//            if let row = tableView.indexPathForSelectedRow?.row {
//                let album = albumsDS?.albumAt(row)
//                let detailedVC = segue.destinationViewController as! AlbumDetailedViewController
//                detailedVC.albumForThisView(album!)
//            }

            // OR
            let cell = sender as! ArtistTableViewCell
            if let indexPath = tableView.indexPathForCell(cell), let ds = artistsDS {
                let detailedVC = segue.destinationViewController as! AlbumsTableViewController
                detailedVC.artistForAlbums(ds.artistAt(indexPath.row).artistId()!)
            }
            
        }
        
        
    }


}
