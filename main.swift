//
//  main.swift
//  Exercices
//
//  Created by SUP'Internet 04 on 09/01/2018.
//  Copyright © 2018 SUP'Internet 04. All rights reserved.
//

import Foundation

print(condog(str: " find it disgusting ", prefix: "I", suffix: "that I can't write it on my own computer"))
print(cleanHobbits(arr: ["Frodo", "Aragorn", "Boromir", "Legolas", "Gimli", "Gandalf", "Samsaget"]))

ApiManager.getInstance().getRandomUserHydratedWithPerson(userCompletion: { person in
    person.show()
})
RunLoop.main.run();
