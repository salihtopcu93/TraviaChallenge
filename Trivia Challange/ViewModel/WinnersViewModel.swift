//
//  WinnersViewModel.swift
//  Trivia Challange
//
//  Created by salih topcu on 11.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import Foundation
import Alamofire


protocol WinnersViewDelegate : class {
    func winnerUpdatedList()
}

class WinnersViewModel {
    var result: Winners?
    var delegate: WinnersViewDelegate?
    
    let urlString: String = "http://www.mocky.io/v2/5caf1ee13400007e2aab70ce"
    
    init() {
        getWinners()
    }
    
    func getWinners() {
        setLoading(true)
        
        Alamofire.request( urlString).responseJSON
            { (response) in
                guard let data = response.data else {return}
                
                do {
                    let result = try JSONDecoder().decode(Winners.self, from: data)
                    
                    self.result = result
                    self.delegate?.winnerUpdatedList()
                    
                } catch let error {
                    print(error)
                }
                self.setLoading(false)
        }
    }
    
    func getListCount() -> Int {
        return result?.winnersNames.count ?? 0
    }
    
    public func setLoading (_  isLoading : Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
    
}
