//
//  ChooseSideViewController.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ChooseSideViewController: UIViewController {
    
    var viewModel: ChooseSideViewModelProtocol?
    var routes: ChooseDIContainerProtocol?
    
    var disposeBag = DisposeBag()
    
    public class func instantiate(viewModel: ChooseSideViewModel, routes: ChooseDIContainerProtocol) -> ChooseSideViewController {
        let storyboard = UIStoryboard(name: "ChooseSideViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ChooseSideViewController") as! ChooseSideViewController
        view.viewModel = viewModel
        view.routes = routes
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    @IBAction func lightSideButton(_ sender: Any) {
        viewModel?.getLightSidePeopleList()
    }

    func bind() {
        viewModel?.peopleList.drive(onNext: { (peoples) in
            guard let people = peoples else { return }
            guard let vc = self.routes?.callListScreen(people: people) else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: disposeBag)
    }
    
    func shareImage() {
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)

    }
    
    @IBAction func darkSideButton(_ sender: Any) {
        viewModel?.getDarkSidePeopleList()
    }
    
    
    @IBAction func share(_ sender: Any) {
        shareImage()
    }
}
