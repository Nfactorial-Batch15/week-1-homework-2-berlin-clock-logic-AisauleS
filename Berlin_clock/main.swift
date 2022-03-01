//
//  main.swift
//  Berlin_clock
//
//  Created by Aisaule Sibatova on 02.12.2021.
//

import Foundation

print ("Enter the time in format hh:mm:ss")
var inputTime : String

if let a = readLine () {
    inputTime = a
} else {
    inputTime = "default"
    print("Please enter the time again")
}

var arrOfInputTime: [String] = inputTime.components(separatedBy: [":"])
var hours = Int(arrOfInputTime[0])
var minutes = Int(arrOfInputTime[1])
var second = Int(arrOfInputTime[2])


func convertFiveHours (_ hours: Int) -> String {
    var fiveHours = hours/5
    var fiveHourLamps: [String] = ["" , "", "", ""]
    
    for _ in fiveHourLamps {
        fiveHourLamps.append(fiveHours > 0 ? "R" : "O")
        fiveHours -= 1
    }

    let str = fiveHourLamps.joined(separator: "")
    return str
}


func convertOneHours (_ hours: Int) -> String {
    var oneHours = hours - 20
    var oneHourLamps: [String] = ["" , "", "", ""]
    
    for _ in  oneHourLamps {
        oneHourLamps.append(oneHours > 0 ? "R" : "O")
        oneHours -= 1
    }
    let str = oneHourLamps.joined(separator: "")
    return str
}

func convertFiveMinutes (_ minutes: Int) -> String {
    let fiveMinutes = minutes/5
    var fiveMinuteLamps: [String] = ["" , "", "", "", "","" , "", "", "", "", ""]
    
        for n in 1...11 {
            fiveMinuteLamps.append(n <= fiveMinutes ? minuteLampsColour(n) : "O")
        }
    
    func minuteLampsColour(_ index: Int) -> String {
        return index % 3 == 0 ? "R" : "Y"
    }
        
    let str = fiveMinuteLamps.joined(separator: "")
    return str
}



func convertOneMinutes (_ minutes: Int) -> String {
    var oneMinutes = minutes - 55
    var oneMinuteLamps: [String] = ["" , "", "", ""]
    
    for _ in  oneMinuteLamps {
        oneMinuteLamps.append(oneMinutes > 0 ? "Y" : "O")
        oneMinutes -= 1
    }
    let str = oneMinuteLamps.joined(separator: "")
    return str
    
}

func convertSeconds (_ seconds: Int) -> String {
    if seconds % 2 == 0 {
        return "O" } else
    {return "Y"}
}

var fiveHoursResult = convertFiveHours(hours!)
var oneHoursResult = convertOneHours(hours!)
var fiveMinutesResult = convertFiveMinutes(minutes!)
var oneMinutesResult = convertOneMinutes(minutes!)
var secondsResult = convertSeconds(second!)

print("Five hours row : " + fiveHoursResult)
print("One hours row : " + oneHoursResult)
print("Five minutes row: " + fiveMinutesResult)
print("One minutes row: " +  oneMinutesResult)
print("Top Lamp : " +  secondsResult)

