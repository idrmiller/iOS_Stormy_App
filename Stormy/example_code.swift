//
//  example_code.swift
//  Stormy
//
//  Created by David Miller on 4/5/15.
//  Copyright (c) 2015 David Miller. All rights reserved.
//

import Foundation

// Exam question. deifning the absolute url and 

let courseID = 25
let treehouseBaseURL = NSURL(string: "https://api.teamtreehouse.com/")
let courseURL = NSURL(string: "course/\(courseID)", relativeToURL: treehouseBaseURL)

private let apiKey = "7bb2c2a909c20c82f3bb31b1f2873ec8"

let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
let forcastURL = NSURL(string: "38.897193,-77.025013", relativeToURL: baseURL)




