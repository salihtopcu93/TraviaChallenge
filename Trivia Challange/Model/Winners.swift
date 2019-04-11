//
//  Winners.swift
//  Trivia Challange
//
//  Created by salih topcu on 11.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import Foundation

struct Winners {
    let winnersGet : Double
    let winnersNames : [WinnersNames]
}

extension Winners: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    enum  WinnersCodingKeys : String, CodingKey{
        case winnersGet
        case winnersNames = "winnersNames"
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let container = try values.nestedContainer(keyedBy: WinnersCodingKeys.self, forKey: .response)
        
        winnersGet = try container.decode(Double.self, forKey: .winnersGet)
        winnersNames = try container.decode([WinnersNames].self, forKey: .winnersNames)
    }
}
