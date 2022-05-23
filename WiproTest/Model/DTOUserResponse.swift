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
    //Drop the object where each property is null
    var filteredInfo: [DTOUserInfo]? {
        self.userInfo?.filter({ $0.userInfoTitle != nil || $0.userInfoImage != nil || $0.userInfoDescription != nil })
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
