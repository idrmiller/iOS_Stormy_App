//
//  ViewController.swift
//  Stormy
//
//  Created by David Miller on 4/5/15.
//  Copyright (c) 2015 David Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let apiKey = "7bb2c2a909c20c82f3bb31b1f2873ec8"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
        let forcastURL = NSURL(string: "38.897193,-77.025013", relativeToURL: baseURL)
        
        /* The code below shows the ability to extract the data from the api and store it in the 
            weatherData object using NSDATA. At this stage the results are shown in hex code. We 
            demonstrated this by inputinh println after the code. 
        */
        
        //  We are creating a singeleton to allow this session to manage our whole app.
        //  We are using a closure to make a asynchronous call so we can capture the reference to the variables when the task completes in the background.
        
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forcastURL!, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            println(response)
        })
        
        downloadTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

