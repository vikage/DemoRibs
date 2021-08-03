//
//  SelectMediaViewController.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs
import RxSwift
import UIKit

protocol SelectMediaPresentableListener: AnyObject {
    func dismiss(animated: Bool)
    func nextToProjectSetting()
}

final class SelectMediaViewController: UIViewController, SelectMediaPresentable, SelectMediaViewControllable {

    weak var listener: SelectMediaPresentableListener?
    
    @IBAction func closeDidTap(_ sender: Any) {
        self.listener?.dismiss(animated: true)
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        self.listener?.nextToProjectSetting()
    }
    
}
