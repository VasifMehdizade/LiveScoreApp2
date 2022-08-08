//
//  Model.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 25.07.22.
//

import Foundation

struct Users : Codable {
    let name : String
    let surname : String
    let email : String
    let password : String
    let gender : String
}

struct CountryModel : Codable {
    let name : String
    let id : Int
    let leagues : [LeagueModel]
}

struct LeagueModel : Codable {
    let name : String
    let id : Int
}

struct Matches : Codable{
    let homeTeam : String
    let rival : String
    let firstScore : String
    let secondScore : String
}
    

