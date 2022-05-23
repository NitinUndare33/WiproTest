//
//  Mirror+Extensions.swift
//  WiproTest
//
//  Created by Ganesh Padole on 23/05/22.
//

import Foundation
import UIKit
protocol Reflection {
    var mirror: Mirror { get set }
    
    func extract<T>(variableName: StaticString) -> T?
}

extension Reflection {
    func extract<T>(variableName: StaticString = #function) -> T? {
        mirror.descendant("\(variableName)") as? T
    }
}

class ViewControllerMirror: Reflection {
    var mirror: Mirror
    
    init(viewController: UIViewController) {
        mirror = Mirror(reflecting: viewController)
    }
}

class TableViewCellMirror: Reflection {
    var mirror: Mirror
    
    init(tableViewCell: UITableViewCell) {
        mirror = Mirror(reflecting: tableViewCell)
    }
}
