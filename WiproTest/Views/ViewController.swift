//
//  ViewController.swift
//  WiproTest
//
//  Created by Undare, Nitin Namadeo (INFOSYS) on 13/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    // Variables
    var viewModel: UserViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = UserViewModel()
        viewModel?.delegate = self
        viewModel?.getUserDetails()
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.userData.userInfo?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UserDataCell
        let data = viewModel?.userData.userInfo?[indexPath.row]
        cell?.userTitle.text = data?.userInfoTitle ?? ""
        cell?.userSubtitle.text = data?.userInfoDescription ?? ""
        cell?.userImage.loadImage(urlString: data?.userInfoImage ?? "")
        return cell!
    }
}
//
extension ViewController: ProtocolUserViewModel {
    func productDetails(result: DTOUserResponse?, error: DTOError?) {
        if error == nil {
            // reload table
            userTableView.reloadData()
        } else {
            print(error!)
        }
    }
}


