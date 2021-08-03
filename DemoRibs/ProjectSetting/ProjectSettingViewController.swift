//
//  ProjectSettingViewController.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs
import RxSwift
import UIKit

protocol ProjectSettingPresentableListener: AnyObject {
    func dismissProjectSetting(animated: Bool)
    func saveProject(name: String)
}

final class ProjectSettingViewController: UIViewController, ProjectSettingPresentable, ProjectSettingViewControllable {

    weak var listener: ProjectSettingPresentableListener?
    
    func bindProject(_ project: Project) {
        NSLog("Bind project \(project.name)")
    }
    
    @IBAction func backButtonDidtap(_ sender: Any) {
        self.listener?.dismissProjectSetting(animated: true)
    }
    
    @IBAction func doneButtonDidTap(_ sender: Any) {
        self.listener?.saveProject(name: "XXX")
    }
}
