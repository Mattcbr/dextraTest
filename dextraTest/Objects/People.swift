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
    let repoCount: Int
    let repositories: [Repositories]
    
    init(id: Int, name: String, thumbPath: String, repoCount: Int, repos: [Repositories]) {
        self.id   = id
        self.name = name
        self.repoCount = repoCount
        self.thumbnailPath = thumbPath
        self.repositories = repos
    }
}
