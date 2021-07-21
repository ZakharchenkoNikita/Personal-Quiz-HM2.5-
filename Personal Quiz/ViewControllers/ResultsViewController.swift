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
            if let animalTypeCount = animals[answer.type] {
                animals.updateValue(animalTypeCount + 1, forKey: answer.type)
            } else {
                animals[answer.type] = 1
            }
        }
    }
    
    private func setupUI() {
        navigationItem.setHidesBackButton(true, animated: false)
        getSortedAnimals()
        
        if let result = result {
            animalLabel.text = "Вы - \(result.key.rawValue)"
            descriptionTextLabel.text = "\(result.key.definition)"
        }
    }
}
