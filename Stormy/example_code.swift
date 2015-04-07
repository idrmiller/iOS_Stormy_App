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


