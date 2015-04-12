//
//  ViewController.swift
//  Stormy
//
//  Created by David Miller on 4/5/15.
//  Copyright (c) 2015 David Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var perciptationLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    
    private let apiKey = "7bb2c2a909c20c82f3bb31b1f2873ec8"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
        let forcastURL = NSURL(string: "38.897193,-77.025013", relativeToURL: baseURL)
        
        //  We are creating a singeleton to allow this session to manage our whole app.
        //  We are using a closure to make a asynchronous call so we can capture the reference to the variables when the task completes in the background.
        // The location:NSURL is the location where the information is saved
        
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forcastURL!, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            // We added this if statment to aid ensure our code does nto break. This allows us to explicitly handel the error.
            if (error == nil) {
                
                //  The (location) identified in this parameter is the location on the disc
                let dataObject = NSData(contentsOfURL: location)
                
                // This bit of code is to help convert our dataObject to JSOn to make it readable.
                let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
                
               let currentWeather = Current(weatherDictionary: weatherDictionary)
                
                // Allows us to ensure proper queing the code for best performance.
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.temperatureLabel.text = "\(currentWeather.temperature)"
                    self.iconView.image = currentWeather.icon!
                    self.currentTimeLabel.text = "At \(currentWeather.currentTime!) it is"
                    self.humidityLabel.text = "\(currentWeather.humidity)"
                    self.perciptationLabel.text = "\(currentWeather.precipProbability)"
                    self.summaryLabel.text = "\(currentWeather.summary)"
                })
                
            }
            
            
            
        })
        
        downloadTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

