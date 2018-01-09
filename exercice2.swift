//
//  exercice2.swift
//  Exercices
//
//  Created by SUP'Internet 04 on 09/01/2018.
//  Copyright © 2018 SUP'Internet 04. All rights reserved.
//

import Foundation

func cleanHobbits(arr :Array<String>) -> (String, String, Array<String>, Int){
    var truncatedArray :Array<String> = arr
    truncatedArray.removeFirst()
    truncatedArray.removeLast()
    var reversedArray :Array<String> = []
    for elem in truncatedArray{
        reversedArray.insert(elem, at: 0)
    }
    return (arr[0], arr.last!, reversedArray, reversedArray.count)
}
