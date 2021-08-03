//
//  AppComponent.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import Foundation
import RIBs

class AppComponent: Component<EmptyComponent>, RootDependency {
    var window: UIWindow
    init(window: UIWindow) {
        self.window = window
        super.init(dependency: EmptyComponent())
    }
}
