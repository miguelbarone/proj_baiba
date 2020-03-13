//
//  PeopleListRepositoryImpl.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PeopleListRepositoryImpl: PeopleListRepository {
    
    var peopleService = PeopleService()
    
    func getPeopleList() -> Single<[People]> {
        let list: Single<BaseAPIResponse> = peopleService.getDecodedResponse()
        return list.map { (uncleanPeople) in
            return uncleanPeople.mapToPeople()
        }
    }
}
