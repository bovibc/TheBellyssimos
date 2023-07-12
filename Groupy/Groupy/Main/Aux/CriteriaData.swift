//
//  CriteriaText.swift
//  Groupely
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
    case Previous_Interations = "Previous Interactions"
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
    case Diversity = "More than one research pointed out that isolating individuals from minority groups - such as women on a class where students are predominantly male, for example - can be a bad idea, since it makes it harder for those individuals to feel safe and truly thrive in an educational environment.\n\nThat said, with Groupely you can easily form groups in which people from minority groups are kept together - and, at the same time, evenly distributed among groups, so that they can engage comfortably and safely in the learning process."
    case Personality = "Studies have shown that the development of interpersonal and intrapersonal skills can be boosted in an educational environment when personality traits are taken into account and evenly distributed. Groupely can help you guarantee that groups will be balanced when it comes to that.\n\nForming groups based on your students personality's tests results - namely MBTI or Working Styles -, we can help you form groups where the number of extroverts and introverts will be balanced - or where people who focus on detail work together with people that emphasize on the bigger picture, for example."
    case Motivation = "When it comes to motivation, researchs' results make it easy to notice that people with the same motivation work better together, since there is less friction when it comes to setting goals and more synergy during decision making.\n\nWith this in mind, if your goal as an educator is to strengthen the ties between your students or create a project where the interactions between them flow more organically, Groupely can help you with that too."
    case Skill = "If the main goal of a project is for students to hone their hard skills and exchange those skills between themselves, Groupely can really ease the process of building an environment that is perfect for that.\n\nBased on what your students input as their skill set during their profile configuration - for example, a student can declare that they have proficiency in Swift but basic skills on designing a prototype -, we can help you distribute students with different skills and skill levels during group formation, in a way that every group will be balanced when it comes to hard skills diversity."
    case Previous_Interations = "Sometimes all you want as an educator is for students to get to know each other better and work with people that they haven't worked with before - specially when some internal groups are already formed in the class and people aren't mixing the groups by themselves. Guess what? Groupely can help you with that too.\n\nBy keeping track of the previous projects and groups that each student took part in, we can optimize a group formation that prioritizes joining people that still haven't worked with each other."
}

enum CriteriaImage: String {
    case Diversity = "banana"
    case Personality = "dog"
    case Motivation = "gru"
    case Skill = "images"
    case Previous_Interations = "shrek"
}


