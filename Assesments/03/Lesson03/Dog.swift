//
//  Dog.swift
//  Lesson03
//
//  Created by Tony Ruiz on 1/27/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class Dog: Animal {
    
    override func prettyAnimalName() -> String {
        return "Dog name: " + self.name
    }
}