//
//  WinnersNames.swift
//  Trivia Challange
//
//  Created by salih topcu on 11.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import Foundation

struct WinnersNames {
    let name : String
}

extension WinnersNames : Decodable {
    enum WinnersNamesCodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: WinnersNamesCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
}
