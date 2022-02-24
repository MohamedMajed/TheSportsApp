// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sport = try Sport(json)

import Foundation

// MARK: - Sport
struct Sport: Codable {
    let sports: [SportElement]
}

// MARK: Sport convenience initializers and mutators

extension Sport {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Sport.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        sports: [SportElement]? = nil
    ) -> Sport {
        return Sport(
            sports: sports ?? self.sports
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - SportElement
struct SportElement: Codable {
    let idSport, strSport: String
    let strFormat: StrFormat
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}

// MARK: SportElement convenience initializers and mutators

extension SportElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SportElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        idSport: String? = nil,
        strSport: String? = nil,
        strFormat: StrFormat? = nil,
        strSportThumb: String? = nil,
        strSportIconGreen: String? = nil,
        strSportDescription: String? = nil
    ) -> SportElement {
        return SportElement(
            idSport: idSport ?? self.idSport,
            strSport: strSport ?? self.strSport,
            strFormat: strFormat ?? self.strFormat,
            strSportThumb: strSportThumb ?? self.strSportThumb,
            strSportIconGreen: strSportIconGreen ?? self.strSportIconGreen,
            strSportDescription: strSportDescription ?? self.strSportDescription
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
