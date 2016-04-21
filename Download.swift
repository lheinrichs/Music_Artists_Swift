//
//  Download.swift
//  Navigation
//
//  Created by AAK on 3/10/16.
//  Modified by Lauren Heinrichs
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class Download: NSObject {

    var urlString: String
    dynamic var dataFromServer: [AnyObject]?
    dynamic var albumsFromServer: [AnyObject]?
    dynamic var tracksFromServer: [AnyObject]?
    
    init(withURLString: String) {
        urlString = withURLString
        super.init()
    }
    
    func toDict(json: String) {
        let JSONData = json.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        
        dataFromServer = try! NSJSONSerialization.JSONObjectWithData(JSONData!, options: []) as! [AnyObject]
       albumsFromServer = try! NSJSONSerialization.JSONObjectWithData(JSONData!, options: []) as! [AnyObject]
        tracksFromServer = try! NSJSONSerialization.JSONObjectWithData(JSONData!, options: []) as! [AnyObject]
//        fvc.acceptData(ArtistDataSource(dataSource: artists))
    }
    
    func download_request()
    {
        let url:NSURL = NSURL(string: urlString)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        let paramString = "data=Hello"
        request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        
        
        let task = session.downloadTaskWithRequest(request) {
            (
            let location, let response, let error) in
            
            guard let _:NSURL = location, let _:NSURLResponse = response  where error == nil else {
                print("error")
                return
            }
            
            let urlContents = try! NSString(contentsOfURL: location!, encoding: NSUTF8StringEncoding)
            
            guard let _:NSString = urlContents else {
                print("error")
                return
            }
            
            print(urlContents)
            self.toDict(urlContents as String)
            
        }
        
        task.resume()
        
    }
}
