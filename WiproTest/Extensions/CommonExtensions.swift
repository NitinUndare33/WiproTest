//
//  CommonExtensions.swift
//  WiproTest
//
//  Created by Undare, Nitin Namadeo (INFOSYS) on 13/05/22.
//

import Foundation
import UIKit

//Extension to get http status code
extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}

extension UIImageView {
    func loadImage(urlString: String) {
        let imageCache = NSCache<AnyObject, AnyObject>()
        guard let url = URL(string: urlString) else {
            return
        }
        if let cachedImag = imageCache.object(forKey: url as AnyObject) as? UIImage {
            //Return cashed image
            self.image = cachedImag
        }
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url, options: .alwaysMapped)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    imageCache.setObject(image!, forKey: url as AnyObject)
                    self.image = image
                }
                
            } catch let error {
                print(error)
            }
        }
        
    }
}
