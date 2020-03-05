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
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: PeopleListViewModelProtocol!
    var disposeBag = DisposeBag()
    
    public class func create(viewModel: PeopleListViewModel) -> PeopleListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PeopleListViewController") as! PeopleListViewController
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }

    private func bind() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        viewModel.peopleList.map { $0 ?? [] }.drive(tableView.rx.items(cellIdentifier: "cell")) { index, model, cell in
            
            cell.textLabel?.text = model.name
        }.disposed(by: disposeBag)
    }
    
    @IBAction func lightSideButton(_ sender: Any) {
        viewModel.showLightSidePeopleList()
        tableView.reloadData()
    }
    
    @IBAction func darkSideButton(_ sender: Any) {
        viewModel.showDarkSidePeopleList()
        tableView.reloadData()
    }
}
