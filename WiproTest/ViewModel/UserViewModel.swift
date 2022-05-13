//
//  UserViewModel.swift
//  WiproTest
//
//  Created by Undare, Nitin Namadeo (INFOSYS) on 13/05/22.
//

import Foundation
protocol ProtocolUserViewModel: NSObject {
    func productDetails(result: DTOUserResponse? , error: DTOError?)
}

class UserViewModel {
    weak var delegate: ProtocolUserViewModel?
    var userData = DTOUserResponse()
    //
    func getUserDetails() {
        let resource = UserResource()
        resource.getUserDetails { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.userData = data
                    self.delegate?.productDetails(result: data, error: nil)
                case .failure(let error):
                    self.delegate?.productDetails(result: nil, error: error)
                }
            }
        }
    }
}
