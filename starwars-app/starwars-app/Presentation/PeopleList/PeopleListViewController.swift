//
//  PeopleListViewController.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PeopleListViewController: UIViewController {
    @IBOutlet weak var peopleTableView: UITableView!
    
    private var _DIProtocol: PeopleListDIContainerProtocol?
    
    var viewModel: PeopleListViewModel!
    var disposeBag = DisposeBag()
    
    public class func instantiate(viewModel: PeopleListViewModel, DIProtocol: PeopleListDIContainerProtocol) -> PeopleListViewController {
        let storyboard = UIStoryboard(name: "PeopleListViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PeopleListViewController") as! PeopleListViewController
        view.viewModel = viewModel
        view._DIProtocol = DIProtocol
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleTableView.register(UINib(nibName: "PeopleTableViewCell", bundle: nil), forCellReuseIdentifier: "PeopleTableViewCell")
        bind()
    }

    private func bind() {
        viewModel.peopleList.drive(peopleTableView.rx.items(cellIdentifier: "PeopleTableViewCell", cellType: PeopleTableViewCell.self)) { index, model, cell in
            cell.configure(model: model)
        }.disposed(by: disposeBag)
        
        peopleTableView.rx.itemSelected.subscribe(onNext: { (idx) in
            guard let people = self.viewModel.getPeople(index: idx.row) else { return }
            guard let vc = self._DIProtocol?.makePeopleDetailsViewController(people: people) else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: disposeBag)
    }

}
