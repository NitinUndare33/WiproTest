//
//  HttpUtility.swift
//  WiproTest
//
//  Created by Undare, Nitin Namadeo (INFOSYS) on 13/05/22.
//

import Foundation
struct HttpUtility {
    func getAPI<T: Decodable>(requestURL: URL, resultType: T.Type,
                              completion: @escaping(_ result: T?, _ error: DTOError?) -> Void) {
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        //
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if error == nil {
                    do {
                        let resultData = Data(String(decoding: data!, as: UTF8.self).utf8)
                        print("**** result data: \(String(decoding: data!, as: UTF8.self))")
                        let result = try JSONDecoder().decode(T.self, from: resultData)
                        completion(result, nil)
                    } catch let error {
                        completion(nil, DTOError(errorMessage: error.localizedDescription, errorCode: response?.getStatusCode()))
                    }
                } else {
                    completion( nil, DTOError(errorMessage: ErrorMessage.apiDown, errorCode: response?.getStatusCode()))
                }
            }
        }.resume()
    }
}
