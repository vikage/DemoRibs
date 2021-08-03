//
//  MainEditorRouter.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs

protocol MainEditorInteractable: Interactable {
    var router: MainEditorRouting? { get set }
    var listener: MainEditorListener? { get set }
}

protocol MainEditorViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class MainEditorRouter: ViewableRouter<MainEditorInteractable, MainEditorViewControllable>, MainEditorRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: MainEditorInteractable, viewController: MainEditorViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
