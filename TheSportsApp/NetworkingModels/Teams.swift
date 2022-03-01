//
//  Teams.swift
//  TheSportsApp
//
//  Created by Mohamed Maged on 01/03/2022.
//

import Foundation

struct TeamsModel : Codable {
    let teams: [TeamsData]
}

struct TeamsData : Codable {
    
    let strTeam:String
    let strSport:String
    let strLeague:String
    let strStadium:String
    let strStadiumThumb:String
    let strStadiumLocation:String
    let strTeamBadge:String
    let strTeamLogo:String
    let TeamBanner:String
    
}
