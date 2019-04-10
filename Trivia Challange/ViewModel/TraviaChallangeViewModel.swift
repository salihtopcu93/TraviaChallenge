//
//  TraviaChallangeViewModel.swift
//  Trivia Challange
//
//  Created by salih topcu on 8.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import Foundation
import Alamofire

protocol TraviaChallangeViewDelegate : class {
    func updatedList()
}

class TraviaChallangeViewModel {
    var result: TraviaChallangeModel?
    var delegate: TraviaChallangeViewDelegate?
    
    let urlString: String = "http://www.mocky.io/v2/5cade73a2f000061283a993d"
    
    init() {
        getTriviaChallenge()
    }
    
    func getTriviaChallenge() {
        setLoading(true)
        
        Alamofire.request( urlString).responseJSON
            { (response) in
                guard let data = response.data else {return}
                
                do {
                    let result = try JSONDecoder().decode(TraviaChallangeModel.self, from: data)
                    
                    self.result = result
                    self.delegate?.updatedList()
                    
                } catch let error {
                    print(error)
                }
                self.setLoading(false)
        }
    }
    
    public func setLoading (_  isLoading : Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
    
}

enum AlertType {
    case joker, elimination
    
    var title: String {
        switch self {
        case .joker:
            return "Acele Et"
        case .elimination:
            return "Dikkat"
        }
    }
    
    var message: String {
        switch self {
        case .joker:
            return "Zaman doluyor, joker kullan!"
        case .elimination:
            return "Elendiniz."
        }
    }
    
}

enum ButtonState {
    case trueAnswer, falseAnswer, selectedAnswer
}
