//
//  TraviaChallangeModel.swift
//  Trivia Challange
//
//  Created by salih topcu on 8.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import Foundation

struct TraviaChallangeModel {
    let joker : Int
    let questions : [Questions]
}

extension TraviaChallangeModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    enum  TraviaChallangeModelCodingKeys : String, CodingKey{
        case joker
        case questions = "questions"
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        let container = try values.nestedContainer(keyedBy: TraviaChallangeModelCodingKeys.self, forKey: .response)
        
        joker = try container.decode(Int.self, forKey: .joker)
        questions = try container.decode([Questions].self, forKey: .questions)
    }
}
