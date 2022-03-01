//
//  LatestResults.swift
//  TheSportsApp
//
//  Created by Mohamed Maged on 01/03/2022.
//

import Foundation

struct LatestResultsModel: Codable{
    
    let results: [LatestResultsData]
}
struct LatestResultsData: Codable {
    let strEvent: String
    let strThumb: String
    let intHomeScore: String
    let intAwayScore: String
    let dateEvent: String
}
