//
//  ProjectSettingRouter.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs

protocol ProjectSettingInteractable: Interactable {
    var router: ProjectSettingRouting? { get set }
    var listener: ProjectSettingListener? { get set }
}

protocol ProjectSettingViewControllable: ViewControllable {
    
}

final class ProjectSettingRouter: ViewableRouter<ProjectSettingInteractable, ProjectSettingViewControllable>, ProjectSettingRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ProjectSettingInteractable, viewController: ProjectSettingViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
