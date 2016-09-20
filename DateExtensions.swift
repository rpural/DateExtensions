//
//  DateExtensions.swift
//
//  Created by Robert Nix on 6/18/16.
//  Copyright © 2016 Nix, Robert P. All rights reserved.
//

import Foundation

// Define methods that allow us to add and subtract
// DateComponents instances

// The addition and subtraction code is nearly the same,
// so we've factored it out into this method
func combineComponents(_ lhs: DateComponents,
                       rhs: DateComponents,
                       _ multiplier: Int = 1)
    -> DateComponents
{
    var result = DateComponents()
    let undefined = Int(NSDateComponentUndefined)
    
    result.second = ((lhs.second! != undefined ? lhs.second! : 0) +
        (rhs.second! != undefined ? rhs.second! : 0) * multiplier)
    result.minute = ((lhs.minute! != undefined ? lhs.minute! : 0) +
        (rhs.minute! != undefined ? rhs.minute! : 0) * multiplier)
    result.hour = ((lhs.hour! != undefined ? lhs.hour! : 0) +
        (rhs.hour! != undefined ? rhs.hour! : 0) * multiplier)
    result.day = ((lhs.day! != undefined ? lhs.day! : 0) +
        (rhs.day! != undefined ? rhs.day! : 0) * multiplier)
    result.month = ((lhs.month! != undefined ? lhs.month! : 0) +
        (rhs.month! != undefined ? rhs.month! : 0) * multiplier)
    result.year = ((lhs.year! != undefined ? lhs.year! : 0) +
        (rhs.year! != undefined ? rhs.year! : 0) * multiplier)
    return result
}

// With combineComponents defined,
// overloading + and - is simple

/**
 Addition overloaded for DateComponents
 
 Allow two objects of type `DateComponents` to be added together.
 
 - parameters:
    - lhs
    DateComponents -
    The left hand side of the addition
 
    - rhs
    DateComponents -
    The right hand side of the addition
 
 - returns:
    DateComponents -
    The two given parameters summed together
 */
func +(lhs: DateComponents, rhs: DateComponents) -> DateComponents
{
    return combineComponents(lhs, rhs: rhs)
}

/**
 Subtraction overloaded for DateComponents
 
 Allow an object of type `DateComponents` to be subtracted from another.
 
 - parameters:
     - lhs
     DateComponents -
     The left hand side of the subtraction
 
     - rhs
     DateComponents -
     The right hand side of the subtraction
 
 - returns:
     DateComponents -
     The difference of the second `DateComponent` subtracted from the first
 */
func -(lhs: DateComponents, rhs: DateComponents) -> DateComponents
{
    return combineComponents(lhs, rhs: rhs, -1)
}

// We'll need to overload unary - so we can negate components
/**
 Unary minus overloaded to negate DateComponents
 
 Negate an object of type `DateComponents`.
 
 - parameters:
     - components
     DateComponents -
     The value to be negated.
 
 - returns:
 DateComponents -
 The negated value
 */
prefix func -(components: DateComponents) -> DateComponents {
    var result = DateComponents()
    let undefined = Int(NSDateComponentUndefined)
    
    if(components.second != undefined) { result.second = -components.second! }
    if(components.minute != undefined) { result.minute = -components.minute! }
    if(components.hour != undefined) { result.hour = -components.hour! }
    if(components.day != undefined) { result.day = -components.day! }
    if(components.month != undefined) { result.month = -components.month! }
    if(components.year != undefined) { result.year = -components.year! }
    return result
}

// Let's make it easy to add dates and components,
// and subtract components from dates

/**
 Addition overloaded for Date and DateComponents
 
 Add a `Date` and a `DateComponents` object.
 
 - parameters:
     - lhs
     Date -
     The left hand side of the addition
 
     - rhs
     DateComponents -
     The right hand side of the addition
 
 - returns:
 Date -
 The two given parameters summed together
 */
func +(lhs: Date, rhs: DateComponents) -> Date
{
    return (Calendar.current as Calendar).date(byAdding: rhs, to: lhs)!
}

/**
 Addition overloaded for DateComponents and Date
 
 Add a `DateComponents` and a `Date` object.
 
 - parameters:
     - lhs
     DateComponents -
     The left hand side of the addition
 
     - rhs
     Date -
     The right hand side of the addition
 
 - returns:
 Date -
 The two given parameters summed together
 */
func +(lhs: DateComponents, rhs: Date) -> Date
{
    return rhs + lhs
}

// Date - component
// (Component - date doesn't make sense)
/**
 Subtraction overloaded for Date and DateComponents
 
 Subtract a `DateComponents` from a `Date` object.
 
 - parameters:
     - lhs
     Date -
     The left hand side of the subtraction
 
     - rhs
     DateComponents -
     The right hand side of the subtraction
 
 - returns:
 Date -
 The difference of the two given parameters
 */
func -(lhs: Date, rhs: DateComponents) -> Date
{
    return lhs + (-rhs)
}


// Next, we extend Int to bring some Ruby-like magic
// to date components

extension Int {
    /**
     Return an Int as a DateComponents.second
     
     - returns:
     DateComponents -
     The number of seconds specified by the integer
     */
    var seconds: DateComponents {
        var components = DateComponents()
        components.second = self;
        return components
    }
    
    /**
     Return an Int as a DateComponents.second
     
     - returns:
     DateComponents -
     The number of seconds specified by the integer
     */
    var second: DateComponents {
        return self.seconds
    }
    
    /**
     Return an Int as a DateComponents.minute
     
     - returns:
     DateComponents -
     The number of minutes specified by the integer
     */
    var minutes: DateComponents {
        var components = DateComponents()
        components.minute = self;
        return components
    }
    
    /**
     Return an Int as a DateComponents.minute
     
     - returns:
     DateComponents -
     The number of minutes specified by the integer
     */
    var minute: DateComponents {
        return self.minutes
    }
    
    /**
     Return an Int as a DateComponents.hour
     
     - returns:
     DateComponents -
     The number of hours specified by the integer
     */
    var hours: DateComponents {
        var components = DateComponents()
        components.hour = self;
        return components
    }
    
    /**
     Return an Int as a DateComponents.hour
     
     - returns:
     DateComponents -
     The number of hours specified by the integer
     */
    var hour: DateComponents {
        return self.hours
    }
    
    /**
     Return an Int as a DateComponents.day
     
     - returns:
     DateComponents -
     The number of days specified by the integer
     */
    var days: DateComponents {
        var components = DateComponents()
        components.day = self;
        return components
    }
    
    /**
     Return an Int as a DateComponents.day
     
     - returns:
     DateComponents -
     The number of days specified by the integer
     */
    var day: DateComponents {
        return self.days
    }
    
    /**
     Return an Int * 7 as a DateComponents.day
     
     - returns:
     DateComponents -
     The number of weeks specified by the integer
     */
    var weeks: DateComponents {
        var components = DateComponents()
        components.day = 7 * self;
        return components
    }
    
    /**
     Return an Int * 7 as a DateComponents.day
     
     - returns:
     DateComponents -
     The number of weeks specified by the integer
     */
    var week: DateComponents {
        return self.weeks
    }
    
    /**
     Return an Int as a DateComponents.month
     
     - returns:
     DateComponents -
     The number of months specified by the integer
     */
    var months: DateComponents {
        var components = DateComponents()
        components.month = self;
        return components
    }
    
    /**
     Return an Int as a DateComponents.month
     
     - returns:
     DateComponents -
     The number of months specified by the integer
     */
    var month: DateComponents {
        return self.months
    }
    
    /**
     Return an Int as a DateComponents.year
     
     - returns:
     DateComponents -
     The number of years specified by the integer
     */
    var years: DateComponents {
        var components = DateComponents()
        components.year = self;
        return components
    }
    
    /**
     Return an Int as a DateComponents.year
     
     - returns:
     DateComponents -
     The number of years specified by the integer
     */
    var year: DateComponents {
        return self.years
    }
    
}

extension Date {
    
    /**
     Return a Date, setting the time to midnight
     
     - returns:
     Date -
     Just the date portion of the given Date
     */
    func normalize() -> Date {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([ .year, .month, .day ] , from: self)
        return calendar.date(from: components)!
    }
    
    /**
     Return a DateComponents containing the difference between two dates
     
     - parameters:
         - date -
         The date to subtract from self
     
     - returns:
     DateComponents -
     The difference between the two dates.
     */
    func diff(_ date : Date) -> DateComponents {
        let result : DateComponents
        let normSdate = self.normalize()
        let normEdate = date.normalize()
        if (normSdate.compare(normEdate) == .orderedAscending) {
                result = (Calendar.current as NSCalendar).components([.year, .month, .day], from: normSdate, to: normEdate, options: NSCalendar.Options.matchFirst)
        } else {
            result = (Calendar.current as NSCalendar).components([.year, .month, .day], from: normEdate, to: normSdate, options: NSCalendar.Options.matchFirst)
        }
        return result
    }
    
    /**
     Return a Date after adding an offset in days
     
     - parameters:
         - offsetAmount -
         Int giving the number of days to offset the Date
     
     - returns:
     Date -
     The new Date with the offset added to self
     */
    func offset(_ offsetAmount : Int) -> Date {
        let newDate = self.normalize() + offsetAmount.days
        return newDate
    }
    
    /**
     Return the number of whole years between two dates
     
     - parameters:
         - date -
         The date to compare to self
     
     - returns:
     Int -
     The number of years difference
     */
    func yearsFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.year, from: date, to: self, options: []).year!
    }

    /**
     Return the number of whole months between two dates
     
     - parameters:
         - date -
         The date to compare to self
     
     - returns:
     Int -
     The number of months difference
     */
    func monthsFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.month, from: date, to: self, options: []).month!
    }

    /**
     Return the number of whole weeks between two dates
     
     - parameters:
         - date -
         The date to compare to self
     
     - returns:
     Int -
     The number of weeks difference
     */
    func weeksFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.weekOfYear, from: date, to: self, options: []).weekOfYear!
    }

    /**
     Return the number of whole days between two dates
     
     - parameters:
         - date -
         The date to compare to self
     
     - returns:
     Int -
     The number of days difference
     */
    func daysFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.day, from: date, to: self, options: []).day!
    }

    /**
     Return the number of whole hours between two dates
     
     - parameters:
         - date -
         The date to compare to self
     
     - returns:
     Int -
     The number of hours difference
     */
    func hoursFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.hour, from: date, to: self, options: []).hour!
    }

    /**
     Return the number of whole minutes between two dates
     
     - parameters:
         - date -
         The date to compare to self
     
     - returns:
     Int -
     The number of minutes difference
     */
    func minutesFrom(_ date: Date) -> Int{
        return (Calendar.current as NSCalendar).components(.minute, from: date, to: self, options: []).minute!
    }

    /**
     Return the number of whole seconds between two dates
     
     - parameters:
         - date -
         The date to compare to self
     
     - returns:
     Int -
     The number of seconds difference
     */
    func secondsFrom(_ date: Date) -> Int{
        return (Calendar.current as NSCalendar).components(.second, from: date, to: self, options: []).second!
    }

    /**
     Return a String giving the offset between two dates as text
     
     - parameters:
         - date -
         The date to compare to self
     
     - returns:
     String -
     The difference between the two dates in the largest unit
     */
    func offsetFrom(_ date: Date) -> String {
        if yearsFrom(date)   > 0 { return "\(yearsFrom(date))y"   }
        if monthsFrom(date)  > 0 { return "\(monthsFrom(date))M"  }
        if weeksFrom(date)   > 0 { return "\(weeksFrom(date))w"   }
        if daysFrom(date)    > 0 { return "\(daysFrom(date))d"    }
        if hoursFrom(date)   > 0 { return "\(hoursFrom(date))h"   }
        if minutesFrom(date) > 0 { return "\(minutesFrom(date))m" }
        if secondsFrom(date) > 0 { return "\(secondsFrom(date))s" }
        return ""
    }
  
}
