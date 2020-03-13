//
//  PeopleListRepository.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift

protocol PeopleListRepository: class {
    func getPeopleList()-> Single<[People]>
}
