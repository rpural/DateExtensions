DateExtensions

This takes some of the complication out of date math. Using
this extension allows you to code in a more natural way,
such as things like:

var newDate = NSDate() + 6.days
newDate = newDate + 3.months
newDate = newDate - 1.year

var newDate = NSDate().normalize()  // Set the time portion of the date to midnight. 
	// Makes date differences work out without any sort of remainders.

var newDate = NSDate().diff(iotherDate)
