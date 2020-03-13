//
//  PeopleDetailsDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 09/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

protocol PeopleDetailsDIContainerProtocol {
    func makePeopleDetailsViewController(people: People) -> PeopleDetailsViewController
}

class PeopleDetailsDIContainer: PeopleDetailsDIContainerProtocol {
    func makePeopleDetailsViewController(people: People) -> PeopleDetailsViewController {
        return PeopleDetailsViewController.instantiate(viewModel: PeopleDetailsViewModel(people: people))!
    }
}
