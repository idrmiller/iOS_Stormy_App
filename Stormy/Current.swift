//
//  Current.swift
//  Stormy
//
//  Created by David Miller on 4/9/15.
//  Copyright (c) 2015 David Miller. All rights reserved.
//

import Foundation


struct Current {
    
    
    // We can set each type to optional, because when the app is first loaded, there may be no data.
    var currentTime: Int
    var temperature: Int
    var humidity: Double
    var precipProbability: Double
    var summary: String
    var icon: String
    
    
    // We wll initialize the app with the weather information from the weatherDictionary
    init(weatherDictionary: NSDictionary) {
        
        let currentWeather = weatherDictionary["currently"] as NSDictionary
        
        currentTime = currentWeather["time"] as Int
        temperature = currentWeather["temperature"] as Int
        humidity = currentWeather["humidity"] as Double
        precipProbability = currentWeather["precipProbability"] as Double
        summary = currentWeather["summary"] as String
        icon = currentWeather["icon"] as String
        
        
    }
    
    
}