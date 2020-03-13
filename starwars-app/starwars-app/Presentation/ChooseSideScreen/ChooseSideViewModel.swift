//
//  ChoseSideViewModel.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol ChooseSideViewModelProtocol {
    var peopleList: Driver<[People]?> { get }
    func getLightSidePeopleList()
    func getDarkSidePeopleList()
}

class ChooseSideViewModel: ChooseSideViewModelProtocol {
    
    private var peopleListRelay: BehaviorRelay<[People]?> = BehaviorRelay(value: nil)
    
    var peopleListUseCase: PeopleListUseCase?
    var peopleList: Driver<[People]?> { peopleListRelay.asDriver() }
    var disposeBag = DisposeBag()
    
    init(peopleListUseCase: PeopleListUseCase) {
        self.peopleListUseCase = peopleListUseCase
    }
    
    func getLightSidePeopleList() {
        peopleListUseCase?.getLightSidePeopleList().subscribe(onSuccess: { (peoples) in
            self.peopleListRelay.accept(peoples)
            }).disposed(by: disposeBag)
    }
    
    func getDarkSidePeopleList() {
        peopleListUseCase?.getDarkSidePeopleList().subscribe(onSuccess: { (peoples) in
            self.peopleListRelay.accept(peoples)
            }).disposed(by: disposeBag)
    }
}
