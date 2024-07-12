//
//  Model.swift
//  Eplitcon
//
//  Created by iOS Developer on 11/07/24.
//

import Foundation
struct User: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let distanceInMiles: Double
    let country: String
    let city: String
    let aboutMe: String
    let photoList: [Photo]
    let usersQuestionsList: [UserQuestion]
    let usersInterestList: [UserInterest]
    let verified: Bool
}

struct Photo: Codable {
    let imageUrl: String
    let positionInPics: Int
    let profilePic: Bool
}

struct UserQuestion: Codable {
    let answer: String
    let question: String
}

struct UserInterest: Codable {
    let interestTitle: String
    let iconUrl: String
}

