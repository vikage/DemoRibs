//
//  HomeRouter.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs

protocol HomeInteractable: Interactable, SelectMediaListener, MainEditorListener {
    var router: HomeRouting? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRouting {
    var selectMediaBuilder: SelectMediaBuildable
    var mainEditorBuilder: MainEditorBuildable
    var selectMediaRouting: SelectMediaRouting?
    var mainEditorRouting: MainEditorRouting?
    
    init(interactor: HomeInteractable,
         viewController: HomeViewControllable,
         selectMediaBuilder: SelectMediaBuildable,
         mainEditorBuilder: MainEditorBuildable) {
        self.selectMediaBuilder = selectMediaBuilder
        self.mainEditorBuilder = mainEditorBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToSelectMedia(defaultProject: Project) {
        let selectMediaRouter = selectMediaBuilder.build(withListener: self.interactor, project: defaultProject)
        attachChild(selectMediaRouter)
        
        self.viewController.uiviewController.navigationController?.pushViewController(selectMediaRouter.viewControllable.uiviewController, animated: true)
        selectMediaRouting = selectMediaRouter
    }
    
    func dismissSelectMedia(animate: Bool) {
        guard let selectMediaRouting = self.selectMediaRouting else {
            return
        }
        
        detachChild(selectMediaRouting)
        self.viewController.uiviewController.navigationController?.popViewController(animated: animate)
        self.selectMediaRouting = nil
    }
    
    func routeToMainEditor(project: Project) {
        let mainEditorRouting = mainEditorBuilder.build(withListener: self.interactor, project: project)
        attachChild(mainEditorRouting)
        self.mainEditorRouting = mainEditorRouting
        
        mainEditorRouting.viewControllable.uiviewController.modalPresentationStyle = .fullScreen
        self.viewController.uiviewController.navigationController?.present(mainEditorRouting.viewControllable.uiviewController, animated: true, completion: nil)
    }
    
    func dismissMainEditor() {
        guard let mainEditorRouting = self.mainEditorRouting else {
            return
        }
        
        self.mainEditorRouting = nil
        detachChild(mainEditorRouting)
        self.viewController.uiviewController.navigationController?.dismiss(animated: true, completion: nil)
    }
}
