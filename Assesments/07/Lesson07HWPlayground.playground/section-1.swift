// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var testString = "a b c"

func convertToString() -> String {
    var arrayAsString: String = ""
    for anything in testString {
        if anything == " " {
            arrayAsString = arrayAsString + "\", \""
        } else {
            arrayAsString = arrayAsString + String(anything)
        }
    }
    var niceArrayAsString: String = "\"" + arrayAsString + "\""
    return niceArrayAsString
}

convertToString()


/*
var testString = "a b c"
var newArray: [String]?

var arrayAsString: String = ""

for anything in testString {
    if anything == " " {
        arrayAsString = arrayAsString + "\", \""
        println(",")
    } else {
        arrayAsString = arrayAsString + String(anything)
        println(anything)
    }
}

var niceArrayAsString = "\"" + arrayAsString + "\""
*/