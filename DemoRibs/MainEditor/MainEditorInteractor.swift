//
//  MainEditorInteractor.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import RIBs
import RxSwift

protocol MainEditorRouting: ViewableRouting {
    
}

protocol MainEditorPresentable: Presentable {
    var listener: MainEditorPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol MainEditorListener: AnyObject {
    func dismiss()
}

final class MainEditorInteractor: PresentableInteractor<MainEditorPresentable>, MainEditorInteractable {

    weak var router: MainEditorRouting?
    weak var listener: MainEditorListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: MainEditorPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

// MARK: - MainEditorPresentableListener
extension MainEditorInteractor: MainEditorPresentableListener {
    func dismiss() {
        self.listener?.dismiss()
    }
}
