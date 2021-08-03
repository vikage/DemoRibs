//
//  MainEditorViewController.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs
import RxSwift
import UIKit

protocol MainEditorPresentableListener: AnyObject {
    func dismiss()
}

final class MainEditorViewController: UIViewController, MainEditorPresentable, MainEditorViewControllable {

    weak var listener: MainEditorPresentableListener?
    @IBAction func closeButtonDidTap(_ sender: Any) {
        self.listener?.dismiss()
    }
}
