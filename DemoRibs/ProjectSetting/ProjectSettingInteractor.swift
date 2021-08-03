//
//  ProjectSettingInteractor.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs
import RxSwift

protocol ProjectSettingRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ProjectSettingPresentable: Presentable {
    var listener: ProjectSettingPresentableListener? { get set }
    
    func bindProject(_ project: Project)
}

protocol ProjectSettingListener: AnyObject {
    func dismissProjectSetting(animated: Bool)
    func saveProject(_ project: Project)
}

final class ProjectSettingInteractor: PresentableInteractor<ProjectSettingPresentable>, ProjectSettingInteractable {

    weak var router: ProjectSettingRouting?
    weak var listener: ProjectSettingListener?
    
    var project: Project

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: ProjectSettingPresentable, project: Project) {
        self.project = project
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        self.presenter.bindProject(self.project)
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

extension ProjectSettingInteractor: ProjectSettingPresentableListener {
    func dismissProjectSetting(animated: Bool) {
        self.listener?.dismissProjectSetting(animated: animated)
    }
    
    func saveProject(name: String) {
        self.project.name = name
        self.listener?.saveProject(self.project)
    }
}
