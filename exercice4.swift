//
//  exercice4.swift
//  Exercices
//
//  Created by SUP'Internet 04 on 09/01/2018.
//  Copyright © 2018 SUP'Internet 04. All rights reserved.
//

import Foundation

class ApiManager{
    static var instance :ApiManager?
    
    var baseUrl :String = "https://api.randomuser.me/"
    
    static func getInstance() -> ApiManager{
        if (ApiManager.instance == nil){
            ApiManager.instance = ApiManager()
        }
        
        return ApiManager.instance!
    }
    
    func getRandomUser(completion: @escaping (Any) -> Void){
        var request = URLRequest(url: URL(string: self.baseUrl)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, err in
            guard let data = data, err == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                completion(json)
            }catch let error as NSError {
                print(error)
            }
            
            }.resume()
    }
}



