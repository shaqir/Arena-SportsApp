//
//  LeaguesPresenter.swift
//  Arena
//
//  Created by MacBook on 18/05/2025.
//

import Foundation

class LeaguesPresenter {
    
    weak var leaguesViewController : LeaguesProtocol?
    let leaguesUseCase : LeaguesUsecaseProtocol
    
    init(leaguesUseCase: LeaguesUsecaseProtocol) {
        self.leaguesUseCase = leaguesUseCase
    }
    
    func setTableView(_ leaguesViewController: LeaguesProtocol) {
        self.leaguesViewController = leaguesViewController
    }
    
    func getLeagues(map:Int){
        leaguesUseCase.fetchLeagues(map: map) { result, error in
            if let error = error {
                Logger.log(error.localizedDescription, category: "LeaguesPresenter")
            }

            // MVP nil-safe render: View handles nil by showing empty/error state
            guard let result = result else {
                self.leaguesViewController?.renderLeagues(result: nil)
                return
            }

            self.leaguesViewController?.renderLeagues(result: result)
        
        }
    }
}
