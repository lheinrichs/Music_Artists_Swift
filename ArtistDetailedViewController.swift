//
//  ArtistDetailedViewController.swift
//  ArtistsInTableView
//
//  Created by AAK on 3/11/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class ArtistDetailedViewController: UIViewController {
    
    var artist: Artist?

    @IBOutlet weak var profileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let a = artist {
            self.profileLabel.text = a.artistProfile()
        }
    }
    
    func artistForThisView(artist: Artist) {
        self.artist = artist
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
