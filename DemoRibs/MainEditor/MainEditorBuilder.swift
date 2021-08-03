//
//  MainEditorBuilder.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs

protocol MainEditorDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class MainEditorComponent: Component<MainEditorDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol MainEditorBuildable: Buildable {
    func build(withListener listener: MainEditorListener, project: Project) -> MainEditorRouting
}

final class MainEditorBuilder: Builder<MainEditorDependency>, MainEditorBuildable {

    override init(dependency: MainEditorDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MainEditorListener, project: Project) -> MainEditorRouting {
        let component = MainEditorComponent(dependency: dependency)
        let viewController = MainEditorViewController()
        let interactor = MainEditorInteractor(presenter: viewController)
        interactor.listener = listener
        return MainEditorRouter(interactor: interactor, viewController: viewController)
    }
}
