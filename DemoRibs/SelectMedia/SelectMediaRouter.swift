//
//  SelectMediaRouter.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs

protocol SelectMediaInteractable: Interactable, ProjectSettingListener {
    var router: SelectMediaRouting? { get set }
    var listener: SelectMediaListener? { get set }
}

protocol SelectMediaViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SelectMediaRouter: ViewableRouter<SelectMediaInteractable, SelectMediaViewControllable>, SelectMediaRouting {

    var projectSettingBuildable: ProjectSettingBuildable
    var projectSettingRouting: ProjectSettingRouting?
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: SelectMediaInteractable, viewController: SelectMediaViewControllable, projectSettingBuildable: ProjectSettingBuildable) {
        self.projectSettingBuildable = projectSettingBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToProjectSetting(project: Project) {
        let routing = self.projectSettingBuildable.build(withListener: self.interactor, project: project)
        self.projectSettingRouting = routing
        attachChild(routing)
        
        self.viewControllable.uiviewController.navigationController?.pushViewController(routing.viewControllable.uiviewController, animated: true)
    }
    
    func dismissProjectSetting(animated: Bool) {
        guard let routing = self.projectSettingRouting else {
            return
        }
        
        self.viewControllable.uiviewController.navigationController?.popViewController(animated: animated)
        
        detachChild(routing)
        self.projectSettingRouting = nil
    }
}
