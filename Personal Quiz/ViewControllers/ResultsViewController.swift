//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: IB Outlets
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    // MARK: properties
    var answers: [Answer]!
    
    // MARK: private properties
    private var animals: [AnimalType : Int] = [:]
    
    private var result: Dictionary<AnimalType, Int>.Element? {
        animals.max { min, max in min.value < max.value }
    }
    
    // MARK: override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: private methods
    private func getSortedAnimals() {
        for answer in answers {
            switch answer.type {
            case .dog:
                animals[answer.type, default: 0] += 1
            case .cat:
                animals[answer.type, default: 0] += 1
            case .rabbit:
                animals[answer.type, default: 0] += 1
            case .turtle:
                animals[answer.type, default: 0] += 1
            }
        }
    }
    
    private func setupUI() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        getSortedAnimals()
        
        if let result = result {
            animalLabel.text = "Вы - \(result.key.rawValue)"
            descriptionTextLabel.text = "\(result.key.definition)"
        }
    }
}
