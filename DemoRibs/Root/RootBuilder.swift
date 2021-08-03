//
//  RootBuilder.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs

protocol RootDependency: Dependency {
    var window: UIWindow { get }
}

final class RootComponent: Component<RootDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> RootRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> RootRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)
        
        let homeBuilder = HomeBuilder(dependency: component)
        
        return RootRouter(interactor: interactor, viewController: viewController, homeBuilder: homeBuilder, window: self.dependency.window)
    }
}
