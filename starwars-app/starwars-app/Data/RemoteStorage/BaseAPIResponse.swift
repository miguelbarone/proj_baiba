//
//  BaseAPIResponse.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 04/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

struct BaseAPIResponse: Codable {
    let results: [PeopleAPIReponse]
}

extension BaseAPIResponse {
    func mapToPeople() -> [People] {
        var peopleList: [People] = []
        self.results.forEach { (people) in
            peopleList.append(People(name: people.name,
                                     height: people.height,
                                     mass: people.mass,
                                     faction: people.faction,
                                     hair_color: people.hair_color,
                                     skin_color: people.skin_color,
                                     eye_color: people.eye_color,
                                     birth_year: people.birth_year,
                                     gender: people.gender))
        }
        return peopleList
    }
}
