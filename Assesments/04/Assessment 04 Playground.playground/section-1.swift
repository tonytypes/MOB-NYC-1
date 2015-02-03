// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



var dicti: [String:String] = [
    "key1":"value1",
    "key2":"value2",
    "key3":"value3"
]

//var valuesArray: [String] = []
//var keysArray: [String] = []

//valuesArray = [String](dicti.values)
//keysArray = [String](dicti.keys)

//println("\(keysArray)")
//println(keysArray)

struct Test {
    var valuesArray = [String](dicti.values)
    var keysArray = [String](dicti.keys)
}

let newVariable = Test.valuesArray
