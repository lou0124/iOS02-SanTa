//
//  ResultDetailViewCoordinator.swift
//  SanTa
//
//  Created by Jiwon Yoon on 2021/11/17.
//
import UIKit

class ResultDetailViewCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var coreDataStorage: CoreDataStorage
    var records: Records
//    let viewController: ResultDetailViewController = .init(viewModel: self.injectDependencies())
    
    func start() {
        let resultDetailViewController = ResultDetailViewController(viewModel: injectDependencies())
        resultDetailViewController.coordinator = self
        self.navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController.pushViewController(resultDetailViewController, animated: true)
    }
    
    func dismiss() {
        self.navigationController.popViewController(animated: true)
        self.parentCoordinator?.childCoordinators.removeLast()
    }
    
    init(navigationController: UINavigationController, coreDataStorage: CoreDataStorage, records: Records) {
        self.navigationController = navigationController
        self.coreDataStorage = coreDataStorage
        self.records = records
    }
}

extension ResultDetailViewCoordinator {
    private func injectDependencies() -> ResultDetailViewModel {
        return ResultDetailViewModel(
            useCase: ResultDetailUseCase(
                model: ResultDetailData(
                    records: self.records
                ),
                repository: DefaultResultDetailRepository(
                    recordStorage: CoreDataRecordStorage(
                        coreDataStorage: self.coreDataStorage
                    )
                )
            )
        )
    }
    
    func presentRecordingTitleViewController() {
        guard let viewController = self.navigationController.viewControllers.last as? ResultDetailViewController else {
            print("뷰컨 없음")
            return
        }
        let recordingTitleViewCoordinator = RecordingTitleViewCoordinator(delegate: viewController)
        self.childCoordinators.append(recordingTitleViewCoordinator)
        recordingTitleViewCoordinator.parentCoordinator = self
        
        recordingTitleViewCoordinator.start()
    }
}