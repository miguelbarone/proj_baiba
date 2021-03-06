//
//  PeopleDetailsViewController.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class PeopleDetailsViewController: UIViewController {
    @IBOutlet private weak var nameLabel: UILabel! {
        didSet {
            self.nameLabel.text = self._viewModel?.name
        }
    }
    @IBOutlet private weak var factionLabel: UILabel! {
        didSet {
            self.factionLabel.text = self._viewModel?.faction
        }
    }
    
    private var _viewModel: PeopleDetailsViewModelContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func instantiate(viewModel: PeopleDetailsViewModelContract) -> PeopleDetailsViewController? {
        let sb = UIStoryboard.instantiate(name: .peopleDetails, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: PeopleDetailsViewController.storyboardIdentifier) as? PeopleDetailsViewController else { return nil }
        vc._viewModel = viewModel
        return vc
    }

}
 

