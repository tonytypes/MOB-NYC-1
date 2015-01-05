// Lesson 03 playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.

var name = "Tony"
var age = 18

// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"

var message1 = "Hello \(name), you are \(age) years old!"
println(message1)

// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”

if age > 21 {
    println("You can drink")
}

if age > 18 {
    println("You can vote")
}

if age > 16 {
    println("You can drive")
}

// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.

var message2: String? = nil
if age >= 16 && age < 18 {
    message2 = "You can drive"
} else if age >= 18 && age < 21 {
    message2 = "You can drive and vote"
} else if age > 21 {
    message2 = "You can drive, vote and drink (but not at the same time!)"
}
println(message2)

// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)
var counter = 0
var multiplier = 7
while counter < 50 {
    counter = counter + 1
    println(multiplier - 1)
    multiplier = multiplier + 7
}

// TODO: Create a constant called number
let number: Float = 21

// TODO: Print whether the above number is even
var checker1: Int = 0
checker1 = Int(number) / 2
var checker2: Float = 0
checker2 = number / 2
var checker1floated: Float = 0
checker1floated = Float(checker1)
if checker1floated == checker2 {
    println("even")
} else {
    println("odd")
}

var checker3: Int = 0
checker3 = Int(number)
checker3 % 2


//best way is using "remainders". when you type the following, you'll get a remainder or not depending on... umm... dividing by 2, perhaps: 19%10 ... the remainder will be 9. This is the key to doing this easily.

//for the second assignment, and incorporating the to-dos into it, select the view, open up the code by pressing the double-circle in the upper right of the toolbar. to link an item in the sotryboard to your code, right-click it and drag a referencing outlet into the class. then I should be able to add functionality there somehow. I started by adding it to the Placeholder text in the "First View Controller"

// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below

// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()

// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.
