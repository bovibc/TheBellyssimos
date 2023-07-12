//
//  CriteriaText.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 11/07/23.
//

import Foundation
import UIKit

enum CriteriaType: String {
    case Diversity = "Diversity"
    case Personality = "Personality"
    case Motivation = "Motivation"
    case Skill = "Skill"
    case Previous_Interations = "Previous Interations"
}

struct CriteriaScreenData {
    let title: String
    let image: UIImage?
    let text: String
}

struct CriteriaData {
    let criteriaType: CriteriaType
    
    init(criteriaType: CriteriaType) {
        self.criteriaType = criteriaType
    }
    
    func getCriteriaData() -> CriteriaScreenData {
        switch criteriaType {
        case .Diversity:
            return CriteriaScreenData(
                title: criteriaType.rawValue,
                image: UIImage(named: CriteriaImage.Diversity.rawValue),
                text: CriteriaText.Diversity.rawValue)
        case .Personality:
            return CriteriaScreenData(
                title: criteriaType.rawValue,
                image: UIImage(named: CriteriaImage.Personality.rawValue),
                text: CriteriaText.Personality.rawValue)
        case .Motivation:
            return CriteriaScreenData(
                title: criteriaType.rawValue,
                image: UIImage(named: CriteriaImage.Motivation.rawValue),
                text: CriteriaText.Motivation.rawValue)
        case .Skill:
            return CriteriaScreenData(
                title: criteriaType.rawValue,
                image: UIImage(named: CriteriaImage.Skill.rawValue),
                text: CriteriaText.Skill.rawValue)
        case .Previous_Interations:
            return CriteriaScreenData(
                title: criteriaType.rawValue,
                image: UIImage(named: CriteriaImage.Previous_Interations.rawValue),
                text: CriteriaText.Previous_Interations.rawValue)
        }
    }
}

enum CriteriaText: String {
    case Diversity = "Considering personality as a criterion for group formation fosters harmony, collaboration, and innovative thinking. Embracing individual traits leads to a more cohesive and productive dynamic.a"
    case Personality = "Considering personality as a criterion for group formation fosters harmony, collaboration, and innovative thinking. Embracing individual traits leads to a more cohesive and productive dynamic.b"
    case Motivation = "Considering personality as a criterion for group formation fosters harmony, collaboration, and innovative thinking. Embracing individual traits leads to a more cohesive and productive dynamic.c"
    case Skill = "Considering personality as a criterion for group formation fosters harmony, collaboration, and innovative thinking. Embracing individual traits leads to a more cohesive and productive dynamic.d"
    case Previous_Interations = "Considering personality as a criterion for group formation fosters harmony, collaboration, and innovative thinking. Embracing individual traits leads to a more cohesive and productive dynamic.e"
}

enum CriteriaImage: String {
    case Diversity = "banana"
    case Personality = "dog"
    case Motivation = "gru"
    case Skill = "images"
    case Previous_Interations = "shrek"
}


