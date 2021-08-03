//
//  ProjectSettingBuilder.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs

protocol ProjectSettingDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ProjectSettingComponent: Component<ProjectSettingDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ProjectSettingBuildable: Buildable {
    func build(withListener listener: ProjectSettingListener, project: Project) -> ProjectSettingRouting
}

final class ProjectSettingBuilder: Builder<ProjectSettingDependency>, ProjectSettingBuildable {

    override init(dependency: ProjectSettingDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ProjectSettingListener, project: Project) -> ProjectSettingRouting {
        let component = ProjectSettingComponent(dependency: dependency)
        let viewController = ProjectSettingViewController()
        let interactor = ProjectSettingInteractor(presenter: viewController, project: project)
        interactor.listener = listener
        return ProjectSettingRouter(interactor: interactor, viewController: viewController)
    }
}
