// Playground - noun: a place where people can play
// Lesson 04

//func helloWorld() {
//    println("hello function")
//    println("again!")
//}

//helloWorld()
//helloWorld()
//helloWorld()
//helloWorld()
//helloWorld()


//var name = "Rudd"
//func helloWorld(name: String) {
//    println("Hello \(name)")
//}
//
//helloWorld(name)

//var name = "Rudd"
//func helloWorld(name: String) {
//    println("Hello \(name)!!!")
//}
//
//helloWorld("Rudd")
//helloWorld("Sean")
//helloWorld("Travis")


//If we want to print a line for two names, we can by doing this:

//func helloWorldToTwoPeople(nameOne: String, nameTwo: String) {
//    println("Hello \(nameOne) and \(nameTwo)!")
//}
//
//helloWorldToTwoPeople("Sean", "Travis")
//
//func formattedHelloWorldTextToName(name: String) -> String {
//    return "Hello \(name), have a great class!"
//}
//
//println(formattedHelloWorldTextToName("Tony") + " Woohoo!")
//var formattedText = formattedHelloWorldTextToName("Tony")
//println(formattedText)
//
//func lengthOfNames(nameOne: String, nameTwo: String) -> (Int, Int) {
//    // A function MUST return something, or else Swift doesn't know what to do with it
//    return (countElements(nameOne), countElements(nameTwo))
//}
//
//lengthOfNames("Tony","Lazaro")
//
//var lengths = lengthOfNames("Tony", "Lazaro")
//println(lengths.0)
//println(lengths.1)

// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

// TODO: Write a function that prints out "Hello world!" 10 times

//var message = "Hello World"
//func helloWorldTen() {
//    var counter = 0
//    while counter < 10 {
//        counter = counter + 1
//        println("Hello world")
//    }
//}
//
//helloWorldTen()

// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times

//func hitThisLine() {
//    var counter = 0
//    while counter < 20 {
//        counter = counter + 1
//        println("Hit this line \(counter) times!")
//    }
//}
//
//hitThisLine()

// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"

//func stringAsParameter (name: String) {
//    println("Hello \(name)")
//}
//
//stringAsParameter("Andrew")
//stringAsParameter("Tony")


// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"

//func stringOptional (name: String?) {
//    if let n = name {
//        println("Hello \(n)")
//    } else {
//        println("Hello world!")
//    }
//}
//
//stringOptional("Tony")
//stringOptional(nil)

// In class on 12/17 -- 
// Find out if a string has the letter lowercase "a" in it

//func foo (str: String) -> Bool {
//    for character in str {
//        if character == "a" {
//            return true
//        }
//    }
//    return false
//}
//
//println(foo("minnie"))
//println(foo("annie"))

// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci
// sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.

/*
var n = 10

func fibo () {
    var counter = 2
    var prevPrevN = 0
    var prevN = 1
    var newN = 1
    if n > 2 {
        while counter < n {
            counter = counter + 1
            newN = prevN + prevPrevN
            prevPrevN = prevN
            prevN = newN
            println(newN)
        }
        println(newN)
    } else if n == 2 {
        println(1)
    } else if n == 1 {
        println(0)
    } else {
    println("That is not a valid number.")
    }

}
fibo()

//println(fibo(n))

*/

class FibonacciAdder {
    class func fibonacciNumberAtIndex (indexOfFibonacciNumber: Int) -> Int {
        //  var indexOfFibonacciNumber = 10
        var counter = 2
        var prevPrevN = 0
        var prevN = 1
        var newN = 1
        if indexOfFibonacciNumber > 2 {
            while counter < indexOfFibonacciNumber {
                counter = counter + 1
                newN = prevN + prevPrevN
                prevPrevN = prevN
                prevN = newN
            }
            //                println(newN)
            //                return String(newN)
            return newN
        } else if indexOfFibonacciNumber == 2 {
            //                println(1)
            //                return String(1)
            return 1
        } else if indexOfFibonacciNumber == 1 {
            //                println(0)
            //                return String(0)
            return 0
        } else {
            //                println("You've entered an invalid number.")
            //                return "You've entered an invalid number"
            return 0
            
        }
        
    }

}

var number = FibonacciAdder.fibonacciNumberAtIndex(5)


// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.


// Some notes on different ways to add increments:

/*

var f = 3
f = f + 1
f += 1
f++ //use the variable, and then increment it
println(f)
++f //increment the variable, and then use it
println(f)

*/

// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.

/*

func primeDetector(testNumber: Int) -> String {
    let neither = "neither"
    let prime = "prime"
    let composite = "composite"
    
    //identify exceptional ints, -, 0, 1, 2
    if testNumber <= 1 {
        return neither
    } else if testNumber == 2 {
        return prime
    }
    
    //divide testBumber by each number that is smaller than it
    for i in 2...(testNumber - 1) {
        if testNumber % i == 0 {
            return composite
        }
    }
    
    //give result
    return prime
}

let result = primeDetector(5)

*/

// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)

/*

func fibValueAndPrime(toIndex: Int) {
    for i in 1...toIndex {
        let fibVal = FibonacciAdder.fibonacciNumberAtIndex(i)
        let primeOrComposite = primeDetector(fibVal)
        println("The \(i) index is \(fibVal), and is \(primeOrComposite)")
    }
}

fibValueAndPrime(10)

*/

// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).

// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.



func reverser(input: String) -> String {
    
    //establish some empty String variables to be used in the for loop
    var output: String = ""
    var prev: String = ""
    
    //run a for loop for each character and store them in a way that appends them in reverse order
    for i in input {
        output = String(i)+prev
        prev = output
    }
    
    //take everything that was stored and return them as a single array
    return output

}

reverser("Tony")


// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.

// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).

// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings

// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.
