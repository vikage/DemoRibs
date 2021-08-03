//
//  HomeViewController.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    
    func newProject()
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?
    
    // MARK: - Actions
    @IBAction func newProjectButtonDidTap(_ sender: Any) {
        self.listener?.newProject()
    }
}
