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
    var result: TraviaChallangeModel!
    var delegate: TraviaChallangeViewDelegate?
    
    let urlString: String = "http://www.mocky.io/v2/5cab3da23000000b179049d2"
    
    func getTriviaChallenge(completion: @escaping (TraviaChallangeModel?) -> Void) {

        setLoading(true)
        Alamofire.request( urlString).responseJSON
            { (response) in
                guard let data = response.data else {return}
                
                do {
                    let result = try JSONDecoder().decode(TraviaChallangeModel.self, from: data)
                    self.result = result
                    print(response)
                    completion(result)
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
