// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

struct UpComingEventModel: Codable {
    let events: [UpComingEventData]
}

// MARK: - Event
struct UpComingEventData: Codable {
    let strEvent: String
    let strSport: String
    let strLeague: String
    let dateEvent: String
    let strTime: String
    let strThumb: String
  
}
