//
//  PeopleDetailsViewModel.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

protocol PeopleDetailsViewModelContract {
    var name: String { get }
    var faction: String { get }
}

class PeopleDetailsViewModel: PeopleDetailsViewModelContract {
    private var _people: People
    
    init(people: People) {
        _people = people
    }
    
    var name: String {
        return _people.name
    }
    
    var faction: String {
        return _people.faction
    }
}
