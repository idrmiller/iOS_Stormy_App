//
//  Current.swift
//  Stormy
//
//  Created by David Miller on 4/9/15.
//  Copyright (c) 2015 David Miller. All rights reserved.
//

import Foundation
import UIKit


struct Current {
    
    
    // We can set each type to optional, because when the app is first loaded, there may be no data.
    var currentTime: String?
    var temperature: Int
    var humidity: Double
    var precipProbability: Double
    var summary: String
    var icon: UIImage?
    
    
    // We wll initialize the app with the weather information from the weatherDictionary
    init(weatherDictionary: NSDictionary) {
        
        let currentWeather = weatherDictionary["currently"] as NSDictionary
        
        temperature = currentWeather["temperature"] as Int
        humidity = currentWeather["humidity"] as Double
        precipProbability = currentWeather["precipProbability"] as Double
        summary = currentWeather["summary"] as String
        
        // Get current time out of api and assign
        let currentTimeIntValue = currentWeather["time"] as Int
        currentTime = dataStringFromUnixTime(currentTimeIntValue)
        
        let iconString = currentWeather["icon"] as String
        icon = weatherIconFromString(iconString)

            
        }
    
    //  This section is focused on converting the time from the weather api to normal displayed time. Cleaning our data
    func dataStringFromUnixTime (unixTime: Int) -> String{
        
        // Before we can use the NSDate method we need to assign the NSTimeInterval
        let timeInSeconds = NSTimeInterval(unixTime)
        // Now we can create our NSDate object
        let weatherDate = NSDate(timeIntervalSince1970: timeInSeconds)
        
        // Lets us convert the date object into a string, which will allow us to enter into our UI
        let dateFormater = NSDateFormatter()
        // Now using an included  NSDate formater style to style our date, using the enum value that will look like ex.(3:20 PM)
        dateFormater.timeStyle = .ShortStyle
        
        let stringDate = dateFormater.stringFromDate(weatherDate)
        return stringDate

    }
    
    func weatherIconFromString(stringIcon: String) -> UIImage {
        var imageName: String
        
        switch stringIcon {
        case "clear-day":
            imageName = "clear-day"
        case "clear-night":
            imageName = "clear-night"
        case "rain":
            imageName = "rain"
        case "snow":
            imageName = "snow"
        case "sleet":
            imageName = "sleet"
        case "wind":
            imageName = "wind"
        case "fog":
            imageName = "fog"
        case "cloudy":
            imageName = "cloudy"
        case "partly-cloudy-day":
            imageName = "partly-cloudy"
        case "partly-cloudy-night":
            imageName = "cloudy-night"
        default:
            imageName = "default"
        }
        
        var iconImage = UIImage(named: imageName)
        return iconImage!
        
    }
    
    
    
}