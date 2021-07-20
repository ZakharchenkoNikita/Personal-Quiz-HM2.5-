//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встерчающийся тип живтоного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    // MARK: IB Outlets
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    // MARK: properties
    var answers: [Answer] = []
    
    // MARK: private properties
    private var animals: [AnimalType : Int] = [:]
    private var result: Dictionary<AnimalType, Int>.Element?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func getMaximumValue() {
        for animal in answers {
            switch animal.type {
            case .dog:
                animals[animal.type, default: 0] += 1
            case .cat:
                animals[animal.type, default: 0] += 1
            case .rabbit:
                animals[animal.type, default: 0] += 1
            case .turtle:
                animals[animal.type, default: 0] += 1
            }
        }
        
        result = animals.max { min, max in min.value < max.value }
    }
    
    private func setupUI() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        getMaximumValue()
        
        if let result = result {
            animalLabel.text = "Вы - \(result.key.rawValue)"
            descriptionTextLabel.text = "\(result.key.definition)"
        }
    }
}
