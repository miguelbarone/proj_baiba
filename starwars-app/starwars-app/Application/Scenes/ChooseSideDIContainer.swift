//
//  ChooseSideDIContainer.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

protocol ChooseDIContainerProtocol {
    func callListScreen(people: [People]) -> PeopleListViewController
}

class ChooseDIContainer: ChooseDIContainerProtocol {
    
    var makePeopleDI: PeopleListDIContainer {
        return PeopleListDIContainer()
    }
    
    func callListScreen(people: [People]) -> PeopleListViewController {
        return makePeopleDI.makePeopleListViewController(people: people)
    }
    
    
    func makeChooseSideViewController() -> ChooseSideViewController {
        return ChooseSideViewController.instantiate(viewModel: ChooseSideViewModel(peopleListUseCase: PeopleListUseCase(peopleListRepo: PeopleListRepositoryImpl())), routes: self)
    }
}
