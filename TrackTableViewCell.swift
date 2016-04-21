//
//  TrackTableViewCell.swift
//  ArtistsInTableView
//
//  Created by Lauren Heinrichs on 4/20/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {

 
    var track: Track?
    
    @IBOutlet weak var track_title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func useTrack(let track: Track){
        track_title.text = track.trackName()
    }


}
