//
//  exercice5.swift
//  Exercices
//
//  Created by SUP'Internet 04 on 09/01/2018.
//  Copyright © 2018 SUP'Internet 04. All rights reserved.
//

import Foundation

extension ApiManager{
    func getRandomUserHydratedWithPerson(userCompletion: @escaping (Person) -> Void){
        self.getRandomUser(completion: {data in
            let dictJson = data as! [String: Any]
            let array = dictJson["results"] as! [Any]
            let unwrappedDictJson = array[0] as! [String: Any]
            
            let nameData = unwrappedDictJson["name"] as! [String: Any]
            
            userCompletion(Person(firstname: nameData["first"] as! String, lastname: nameData["last"] as! String, gender: unwrappedDictJson["gender"] as! String, email: unwrappedDictJson["email"] as! String, birthdate: (date: unwrappedDictJson["dob"] as! String, format: "yyyy-MM-dd HH:mm:ss")))
        })
    }
}
