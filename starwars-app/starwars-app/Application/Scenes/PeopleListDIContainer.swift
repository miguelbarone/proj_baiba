//
//  PeopleListDIContainer.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

protocol PeopleListDIContainerProtocol {
    func makePeopleListViewController(people: [People]) -> PeopleListViewController
    func makePeopleDetailsViewController(people: People) -> PeopleDetailsViewController
}

class PeopleListDIContainer: PeopleListDIContainerProtocol {
    private var DetailsDI: PeopleDetailsDIContainerProtocol {
        return PeopleDetailsDIContainer()
    }
    
    func makePeopleListViewController(people: [People]) -> PeopleListViewController {
        return PeopleListViewController.instantiate(viewModel: PeopleListViewModel(peopleList: people), DIProtocol: self)
    }
    
    func makePeopleDetailsViewController(people: People) -> PeopleDetailsViewController {
        return DetailsDI.makePeopleDetailsViewController(people: people)
    }
}
