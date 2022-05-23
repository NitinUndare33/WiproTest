//
//  UserResource.swift
//  WiproTest
//
//  Created by Undare, Nitin Namadeo (INFOSYS) on 13/05/22.
//

import Foundation
struct UserResource {
    typealias userData = (Result<DTOUserResponse, DTOError>) -> Void
    func getUserDetails(completion: @escaping(userData)) {
        let httpHandler = HttpUtility()
        // Create url
        let url = URL(string: APIEndPoints.userAPI)
        //
        httpHandler.getAPI(requestURL: url!, resultType: DTOUserResponse.self) { result, error in
            if error == nil {
                //dont have error
                completion(.success(result!))
            } else {
                //error
                completion(.failure(error!))
            }
        }
    }
}
