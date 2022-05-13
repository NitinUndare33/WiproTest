//
//  DTOUserResponse.swift
//  WiproTest
//
//  Created by Undare, Nitin Namadeo (INFOSYS) on 13/05/22.
//

import Foundation
struct DTOUserResponse: Codable {
    var userTitle: String?
    var userInfo: [DTOUserInfo]?
    //
    enum CodingKeys: String, CodingKey {
        case userTitle = "title"
        case userInfo = "rows"
    }
}

struct DTOUserInfo: Codable {
    var userInfoTitle: String?
    var userInfoDescription: String?
    var userInfoImage: String?
    //
    enum CodingKeys: String, CodingKey {
        case userInfoTitle = "title"
        case userInfoDescription = "description"
        case userInfoImage = "imageHref"
    }
    //
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userInfoTitle = try values.decodeIfPresent(String.self, forKey: .userInfoTitle)
        userInfoDescription = try values.decodeIfPresent(String.self, forKey: .userInfoDescription)
        userInfoImage = try values.decodeIfPresent(String.self, forKey: .userInfoImage)
    }
}

struct DTOError: Error {
    var errorMessage: String?
    var errorCode: Int?
}
