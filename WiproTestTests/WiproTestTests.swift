//
//  WiproTestTests.swift
//  WiproTestTests
//
//  Created by Undare, Nitin Namadeo (INFOSYS) on 13/05/22.
//

import UIKit
import XCTest
@testable import WiproTest

class WiproTestTests: XCTestCase {
    var controller: ViewController!
    var viewControllerMirror: ViewControllerMirror!
    var tableView: UITableView?
    
    override func setUp() {
        super.setUp()
        setUpViewController()
        viewControllerMirror = ViewControllerMirror(viewController: controller)
        tableView = viewControllerMirror.tableView ?? UITableView()
    }
    
    func setUpViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyBoard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        controller.beginAppearanceTransition(true, animated: false)
        controller.endAppearanceTransition()
    }
    
    func test_Objects_ShoudNotNull() {
        XCTAssertNotNil(controller)
        XCTAssertNotNil(viewControllerMirror)
        XCTAssertNotNil(tableView)
    }
    
    func test_APICall_ShouldSucceed() {
        controller.viewModel?.getUserDetails()
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            if let result = self.controller.viewModel?.userData {
                XCTAssertNotNil(result)
                XCTAssertNotNil(result.userTitle)
                XCTAssertNotNil(result.userInfo)
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_EndPointURL_ShoulSucced() {
        let endPoint = URL(string: APIEndPoints.userAPI)
        XCTAssertNotNil(endPoint)
    }
    
    func test_Constant_ShouldSucced() {
        XCTAssertEqual(ErrorMessage.apiDown, "Something went wrong")
        XCTAssertEqual(APIEndPoints.userAPI, "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
    }
}

extension ViewControllerMirror {
    var tableView: UITableView? { return extract() }
}
