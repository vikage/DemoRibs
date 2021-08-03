//
//  SelectMediaInteractor.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs
import RxSwift
import Photos

protocol SelectMediaRouting: ViewableRouting {
    func routeToProjectSetting(project: Project)
    func dismissProjectSetting(animated: Bool)
}

protocol SelectMediaPresentable: Presentable {
    var listener: SelectMediaPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SelectMediaListener: AnyObject {
    func dismissSelectPhoto(animated: Bool)
    func saveSelectedAsset(_ asset: [PHAsset])
    func saveProject(_ project: Project)
}

final class SelectMediaInteractor: PresentableInteractor<SelectMediaPresentable>, SelectMediaInteractable {

    weak var router: SelectMediaRouting?
    weak var listener: SelectMediaListener?
    
    var project: Project

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: SelectMediaPresentable, project: Project) {
        self.project = project
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

// MARK: - SelectMediaPresentableListener
extension SelectMediaInteractor: SelectMediaPresentableListener {
    func dismiss(animated: Bool) {
        self.listener?.dismissSelectPhoto(animated: animated)
    }
    
    func nextToProjectSetting() {
        self.listener?.saveSelectedAsset([]) // Fake assets
        self.router?.routeToProjectSetting(project: self.project)
    }
}

extension SelectMediaInteractor: ProjectSettingListener {
    func dismissProjectSetting(animated: Bool) {
        self.router?.dismissProjectSetting(animated: animated)
    }
    
    func saveProject(_ project: Project) {
        self.listener?.saveProject(project)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.router?.dismissProjectSetting(animated: false)
            self.listener?.dismissSelectPhoto(animated: false)
        }
    }
}
