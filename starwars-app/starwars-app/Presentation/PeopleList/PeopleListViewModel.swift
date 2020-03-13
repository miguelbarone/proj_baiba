//
//  PeopleListViewModel.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PeopleListViewModelProtocol {
    var peopleList: Driver<[People]> { get }
    func getPeople(index: Int) -> People?
}

class PeopleListViewModel {
    private var peopleListRelay: BehaviorRelay<[People]> = BehaviorRelay(value: [])
    
    var peopleList: Driver<[People]> { peopleListRelay.asDriver() }

    init(peopleList: [People]) {
        self.peopleListRelay.accept(peopleList)
    }
    
    func getPeople(index: Int) -> People? {
        return peopleListRelay.value[index]
    }
    
}
