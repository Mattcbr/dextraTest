//
//  Parser.swift
//  dextraTest
//
//  Created by Matheus Queiroz on 4/18/18.
//  Copyright © 2018 mattcbr. All rights reserved.
//

import Foundation

class Parser {
    
    func parseInfo(response: Any) -> [People]{
        let JSONresponse = response as? [String : Any]
        
        let data = JSONresponse?["data"] as? [String : Any]
        let values = data?["results"] as? [[String : Any]]
        
        var peopleArray = [People]()
        
        values?.forEach { person in
            //Array to save repositories of each person
            var repoArray = [Repositories]()
            
            //Colects name and id of each person
            let id = person["id"] as? Int
            let name = person["name"] as? String
            
            //Colects the image path for each person
            let thumbnail = person["thumbnail"] as? [String : Any]
            let path = thumbnail?["path"] as? String
            let ext = thumbnail?["extension"] as? String
            let thumbpath = "\(path!).\(ext!)"
            
            //Colects the repositores of this person
            let comics = person["comics"] as? [String: Any]
            let repoCount = comics?["available"] as? Int
            let repositories = comics?["items"] as? [[String: Any]]
            repositories?.forEach { repository in
                let repoName = repository["name"] as? String
                let repoPath = repository["resourceURI"] as? String
                
                let repository = Repositories(name: repoName!, path: repoPath!)
                repoArray.append(repository)
            }
            
            //Creates a person and saves it in an array of people
            let person = People(id: id!,
                                name: name!,
                                thumbPath: thumbpath,
                                repoCount: repoCount!,
                                repos: repoArray)

            peopleArray.append(person)
        }
       return peopleArray
    }
}
