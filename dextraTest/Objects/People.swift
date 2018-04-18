//
//  People.swift
//  dextraTest
//
//  Created by Matheus Queiroz on 4/18/18.
//  Copyright © 2018 mattcbr. All rights reserved.
//

import Foundation

struct People {
    
    let id: Int
    let name: String
    let thumbnailPath: String
    let repositories: [Repositories]
    
    init(id: Int, name: String, thumbPath: String, repos: [Repositories]) {
        self.id   = id
        self.name = name
        self.thumbnailPath = thumbPath
        self.repositories = repos
    }
}
