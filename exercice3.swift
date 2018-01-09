//
//  exercice3.swift
//  Exercices
//
//  Created by SUP'Internet 04 on 09/01/2018.
//  Copyright © 2018 SUP'Internet 04. All rights reserved.
//

import Foundation

extension String{
    func toDate(format :String) -> Date{
        let dateAsStr = self
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: dateAsStr)!
        return date
    }
}

extension Date{
    func toString(format :String) -> String{
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = format
        
        return dateformatter.string(from: self)
    }
    
    func getYearDifferenceFrom(date :Date) ->Int{
        return Calendar.current.dateComponents([.year], from: date, to: self).year!
    }
}

struct Email :CustomStringConvertible{
    var description: String{
        return self.email!
    }
    
    var email :String?
    
     init(email :String){
        self.email = email
    }
    
    func isValid() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.email)
    }
}

class Existence{
    var birthdate :Date
    var age :Int
    
    init(date :Date?){
        if let date2 = date {
            self.birthdate = date2
            self.age = Date().getYearDifferenceFrom(date: date2)
        }else{
            self.birthdate = Date()
            self.age = 0
        }
        
    }
    
    func willProbablyDieSoon() -> Bool{
        return self.age >= 100
    }
}

class Person :Existence{
    enum Gender {
        case Male, Female, Other
    }
    
    var gender :Gender
    var firstname :String
    var lastname :String
    var email :Email
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: (date: String, format: String)){
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.email = Email(email: email)
        super.init(date: birthdate.date.toDate(format: birthdate.format))
    }
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: Date){
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.email = Email(email: email)
        super.init(date: birthdate)
    }
    
    func show() {
        print("firstname : \(self.firstname) ")
        print("lastname : \(self.lastname) ")
        
        switch self.gender {
        case .Male:
            print("gender : Male")
        case .Female:
            print("gender : Male")
        case .Other:
            print("gender : Other")
        }
        
        print("email valid : \(self.email.isValid())")
        print("email : \(self.email)")
        
        print("birthdate : \(self.birthdate)")
        print("age : \(self.age)")
        print("will die soon : \(self.willProbablyDieSoon())")
        
    }
}
