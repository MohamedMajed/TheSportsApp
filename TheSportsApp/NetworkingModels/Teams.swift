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
    
    let strTeam:String?
    let strSport:String?
    let strLeague:String?
    let strStadium:String?
    let strStadiumThumb:URL?
    let strStadiumLocation:String?
    let strTeamBadge:URL?
    let strTeamLogo:URL?
    let strTeamBanner:URL?
    let strCountry:String?
    let strDescriptionEN:String?
    let strTeamJersey:URL?
    let strFacebook:String?
    let strTwitter:String?
    let strInstagram:String?
    let strWebsite:String?
    let strYoutube:String?
    let intFormedYear:String?
    let intStadiumCapacity:String?
}
