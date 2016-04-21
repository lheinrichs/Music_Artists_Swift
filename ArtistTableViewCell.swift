//
//  ArtistTableViewCell.swift
//  ArtistsInTableView
//
//  Created by AAK on 3/25/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

   
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func useArtist(let artist: Artist) {
        if let aImage = artist.getImage()  {
            cellImage.image = aImage
        }
        cellLabel.text = artist.artistName()
    }
}
