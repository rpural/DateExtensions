DateExtensions

This takes some of the complication out of date math. Using
this extension allows you to code in a more natural way,
such as things like:

var newDate = Date() + 6.days<br/>
newDate = newDate + 3.months<br/>
newDate = newDate - 1.year

These are implemented as an extension to the Int class, yielding DateComponent results.

The + and - have been overloaded for Date, so that Date() + DateComponent() or
DateComponent() + Date() will return a Date().

var newDate = Date().normalize()  // Set the time portion of the date to midnight.<br/> 
	// Makes date differences work out without any sort of remainders.

var newDate = Date().diff(iotherDate)
	// Return the difference between the two dates as a DateComponent()
