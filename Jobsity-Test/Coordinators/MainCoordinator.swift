//
//  MainCoordinator.swift
//  Jobsity-Test
//
//  Created by Pedro Gomes Rubbo Pacheco on 25/01/22.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    func eventOccurred(with type: CoordinatorEvent) {
        switch type {
        case .goToSeasonDetails(let show):
            let vc: ShowDetailsViewController & Coordinating = ShowDetailsViewController.instantiate()
            vc.setShow(show: show)
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
            
        case .goToEpisodeDetails(let episode):
            let vc: EpisodeDetailsViewController & Coordinating = EpisodeDetailsViewController.instantiate()
            vc.setEpisode(episode: episode)
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        let vc: ShowsListViewController & Coordinating = ShowsListViewController.instantiate()
        vc.coordinator = self

        navigationController?.setViewControllers([vc], animated: true)
    }
}
