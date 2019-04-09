//
//  Questions.swift
//  Trivia Challange
//
//  Created by salih topcu on 8.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import Foundation

struct Questions {
    let question : String
    let a : String
    let b : String
    let c : String
    let d : String
    let correctAnswer : String
}

extension Questions : Decodable {
    enum QuestionsCodingKeys: String, CodingKey {
        case question
        case a
        case b
        case c
        case d
        case correctAnswer
    }
    
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: QuestionsCodingKeys.self)
        
        question = try container.decode(String.self, forKey: .question)
        a = try container.decode(String.self, forKey: .a)
        b = try container.decode(String.self, forKey: .b)
        c = try container.decode(String.self, forKey: .c)
        d = try container.decode(String.self, forKey: .d)
        correctAnswer = try container.decode(String.self, forKey: .correctAnswer)
    }
}


