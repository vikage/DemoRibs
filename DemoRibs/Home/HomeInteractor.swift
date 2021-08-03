//
//  HomeInteractor.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs
import RxSwift
import Photos

protocol HomeRouting: ViewableRouting {
    func routeToSelectMedia(defaultProject: Project)
    func dismissSelectMedia(animate: Bool)
    func routeToMainEditor(project: Project)
    func dismissMainEditor()
}

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol HomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable {

    weak var router: HomeRouting?
    weak var listener: HomeListener?
    
    var currentSelectedAsset: [PHAsset]?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: HomePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

// MARK: - HomePresentableListener
extension HomeInteractor: HomePresentableListener {
    func newProject() {
        let project = Project(name: "Default name")
        self.router?.routeToSelectMedia(defaultProject: project)
    }
}

extension HomeInteractor: SelectMediaListener {
    func dismissSelectPhoto(animated: Bool) {
        self.router?.dismissSelectMedia(animate: animated)
    }
    
    func saveSelectedAsset(_ asset: [PHAsset]) {
        self.currentSelectedAsset = asset
    }
    
    func saveProject(_ project: Project) {
        self.router?.routeToMainEditor(project: project)
    }
}

extension HomeInteractor: MainEditorListener {
    func dismiss() {
        self.router?.dismissMainEditor()
    }
}
