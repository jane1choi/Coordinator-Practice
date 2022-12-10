//
//  MainCoordinator.swift
//  Coordinator-Practice
//
//  Created by EUNJU on 2022/12/10.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = MainViewController()
        mainViewController.coordinator = self
        navigationController.pushViewController(mainViewController, animated: true) // 화면전환
    }
    
    func pushFirstViewController() {
        let firstCoordinator = FirstCoordinator(navigationController: navigationController)
        firstCoordinator.parentCoordinator = self
        childCoordinators.append(firstCoordinator)
        firstCoordinator.start()
    }
    
    func pushSecondViewController() {
        let secondCoordinator = SecondCoordinator(navigationController: navigationController)
        secondCoordinator.parentCoordinator = self
        childCoordinators.append(secondCoordinator)
        secondCoordinator.start()
    }
}
