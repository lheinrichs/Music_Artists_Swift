//
//  AlbumTableViewCell.swift
//  ArtistsInTableView
//
//  Created by Lauren Heinrichs on 4/8/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

   var artist: Artist?
  
    @IBOutlet weak var album_title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func useAlbum(let album: Album){
        album_title.text = album.albumName()
    }


}
