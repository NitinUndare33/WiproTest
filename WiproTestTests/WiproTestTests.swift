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
    var tableView = UITableView()
//
//    override func setUp() {
//        super.setUp()
//        setUpViewController()
//        viewControllerMirror = ViewControllerMirror(viewController: controller)
//        tableView = viewControllerMirror.tableView ?? UITableView()
//    }
    
//    func setUpViewController() {
//        let stroyBoard = AllstateEnvironmentSelectionController.storyBoard
//        controller = stroyBoard.instantiateViewController(withIdentifier: "EnvSelectionVC") as? AllstateEnvironmentSelectionController
//        controller.beginAppearanceTransition(true, animated: false)
//        controller.endAppearanceTransition()
//    }
//
//    func testBuildSections() {
//        let section = EnvironmentSwitchSection.buildSections()
//        XCTAssertNotNil(section)
//    }
//
//    func testReduce() {
//        guard let sections = EnvironmentSwitchSection.buildSections() else {
//            return
//        }
//        let section = EnvironmentSwitchSection.reduce(from: sections, model: .milewise, shouldExpand: true)
//        XCTAssertTrue(section.contains { $0.headerIdentifier == AllstateEnvironmentSelectionHeader.identifier })
//    }
//
//    func testNumberOfSections() {
//        // Act & Arrange
//        XCTAssertNotNil(controller.numberOfSections(in: tableView))
//        let sections = tableView.numberOfSections
//        // Assert
//        XCTAssert(sections == 1, "Failed: Number of sections is not two")
//    }
//
//    func testCellForRowAt() {
//        let indexPath = IndexPath(row: 0, section: 0)
//        XCTAssertNotNil(controller.tableView(tableView, cellForRowAt: indexPath))
//    }
//
//    func testNumberOfRowsInSection() {
//        guard let sections = EnvironmentSwitchSection.buildSections() else {
//            return
//        }
//        XCTAssertNotNil(controller.tableView(tableView, numberOfRowsInSection: sections.count - 1))
//    }
//
//    func testSetInitialLaunch() {
//        XCTAssertNotNil(controller.setIntialLaunch(key: Configuration.initialLaunchKey))
//    }
//
//    func testHeightForHeaderInSection() {
//        let height: CGFloat = 45
//        XCTAssertEqual(height, controller.tableView(tableView, heightForHeaderInSection: 45))
//    }
//
//    func testNumberOfRows() {
//        controller.viewDidLoad()
//        XCTAssertNotNil(tableView.numberOfRows(inSection: 0))
//    }
//
//    func testHeightForRow() {
//        let indexPath = IndexPath(row: 0, section: 0)
//        let height = controller.tableView(tableView, heightForRowAt: indexPath) == 80.0
//        XCTAssertTrue(height)
//    }
//
//    func testDatePicker_SetUp_ShouldSucceed() {
//        controller.setupDatePicker()
//        let datePicker = controller.datePickerView
//        XCTAssertNotNil(datePicker)
//        XCTAssertEqual(datePicker?.datePickerMode, .date)
//        XCTAssertNotNil(datePicker?.minimumDate)
//    }
//
//    func testDateTextFeild_ShouldSucceed() {
//        controller.setupDatePicker()
//        let textField = viewControllerMirror.systemDateTextField
//        XCTAssertNotNil(textField)
//        XCTAssertEqual(textField?.inputView, controller.datePickerView)
//        XCTAssertEqual(textField?.tintColor, .clear)
//        if let previousDate = UserDefaults.standard.string(forKey: "SelectedSystemDate") {
//            XCTAssertEqual(textField?.text, "Test System Date (Debug): \(previousDate)")
//        } else {
//            let date = controller.dateFormatter.string(from: Date())
//            XCTAssertEqual(textField?.text, "Test System Date (Debug): \(date)")
//        }
//        XCTAssertEqual(textField?.inputAccessoryView, controller.toolBar)
//    }
//
//    func testDateTextFeild_RightView_ShouldSucceed() {
//        controller.setUpTextFeildImage()
//        XCTAssertEqual(viewControllerMirror.systemDateTextField?.rightViewMode, .always)
//        XCTAssertNotNil(viewControllerMirror.systemDateTextField?.rightView)
//    }
//
//    func testToolBar_ShouldSucceed() {
//        controller.createUIToolBar()
//        let toolBar = controller.toolBar
//        XCTAssertNotNil(toolBar)
//        XCTAssertEqual(toolBar?.barStyle, .default)
//        XCTAssertTrue(toolBar?.isTranslucent ?? false)
//        XCTAssertEqual(toolBar?.tintColor, .white)
//        XCTAssertEqual(toolBar?.items?.count, 3)
//    }
    
}

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
