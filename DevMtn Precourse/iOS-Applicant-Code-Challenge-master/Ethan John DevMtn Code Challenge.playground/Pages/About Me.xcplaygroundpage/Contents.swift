/*:
## About Me

Tell us a little bit about yourself using Swift variables. Start with your first name, your last name, your age, where you're from, and why you want to take the class.
*/
let myFirstName = "Ethan"
let myLastName = "John"
var myAge = 21
var myMotivation = "to open up additional opportunities and career growth."

//: Create an array of Strings that holds a few of your hobbies.
var myHobbies = ["Music Production", "Camping", "Hiking", "Graphic Design"]

/*: 
Programmatically combine the individual strings from your hobbies array into a single string with the hobbies separated by commas.

For example: "Programming, Teaching, Golf, and Basketball."
*/
let hobbyList = myHobbies.joined(separator: ", ")
//: Using the variables you have created, write a programmatically generated sentence to introduce yourself. Use only one print() statement.
print("Hi, my name is \(myFirstName+" "+myLastName). I'm \(myAge) and I enjoy things like \(hobbyList) & plenty of other pastimes. I want to attend DevMounatin \(myMotivation)")

//: [Previous](@previous)
//: [Next](@next)
