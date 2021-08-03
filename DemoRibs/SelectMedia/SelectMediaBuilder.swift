//
//  SelectMediaBuilder.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs

protocol SelectMediaDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SelectMediaComponent: Component<SelectMediaDependency>, ProjectSettingDependency {
    var project: Project
    
    init(dependency: SelectMediaDependency, project: Project) {
        self.project = project
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol SelectMediaBuildable: Buildable {
    func build(withListener listener: SelectMediaListener, project: Project) -> SelectMediaRouting
}

final class SelectMediaBuilder: Builder<SelectMediaDependency>, SelectMediaBuildable {

    override init(dependency: SelectMediaDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SelectMediaListener, project: Project) -> SelectMediaRouting {
        let component = SelectMediaComponent(dependency: self.dependency, project: project)
        let viewController = SelectMediaViewController()
        let interactor = SelectMediaInteractor(presenter: viewController, project: project)
        interactor.listener = listener
        
        let projectSettingBuilder = ProjectSettingBuilder(dependency: component)
        return SelectMediaRouter(interactor: interactor, viewController: viewController, projectSettingBuildable: projectSettingBuilder)
    }
}
