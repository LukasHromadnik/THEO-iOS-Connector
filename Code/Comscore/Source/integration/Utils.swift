//
//  Utils.swift
//
//  Copyright © THEOPlayer. All rights reserved.
//

import Foundation

public struct ComScoreTime {
    let hours: Int
    let minutes: Int
    public init(hours: Int, minutes: Int) {
        self.hours = hours
        self.minutes = minutes
    }
}

public struct ComScoreDate {
    let year: Int
    let month: Int
    let day: Int
    public init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
}

public struct Dimension {
    let width: Int
    let height: Int
    public init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
}
