//
//  HomeBuilder.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs

protocol HomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class HomeComponent: Component<HomeDependency>, SelectMediaDependency, MainEditorDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> HomeRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: HomeListener) -> HomeRouting {
        let component = HomeComponent(dependency: dependency)
        let viewController = HomeViewController()
        let interactor = HomeInteractor(presenter: viewController)
        interactor.listener = listener
        
        let selectMediaBuilder = SelectMediaBuilder(dependency: component)
        let mainEditorBuilder = MainEditorBuilder(dependency: component)
        
        return HomeRouter(interactor: interactor, viewController: viewController, selectMediaBuilder: selectMediaBuilder, mainEditorBuilder: mainEditorBuilder)
    }
}
