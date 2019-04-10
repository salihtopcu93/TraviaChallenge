//
//  CustomButton.swift
//  Trivia Challange
//
//  Created by salih topcu on 10.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureView()
    }
    
    func configureView() {
        self.layer.cornerRadius = 6
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
    
}
