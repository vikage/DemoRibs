//
//  RootRouter.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs

protocol RootInteractable: Interactable, HomeListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: ViewableRouter<RootInteractable, RootViewControllable>, RootRouting {
    var homeBuilder: HomeBuilder
    var window: UIWindow
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, homeBuilder: HomeBuilder, window: UIWindow) {
        self.homeBuilder = homeBuilder
        self.window = window
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        
        routeToHome()
    }
    
    func routeToHome() {
        let homeRouter = homeBuilder.build(withListener: self.interactor)
        attachChild(homeRouter)
        
        let navigationController = UINavigationController(rootViewController: homeRouter.viewControllable.uiviewController)
        navigationController.navigationBar.isHidden = true
        self.window.rootViewController = navigationController
    }
}
