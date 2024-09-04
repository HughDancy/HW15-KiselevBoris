//
//  ViewController.swift
//  HW15-KiselevBoris
//
//  Created by Борис Киселев on 19.06.2022.
//

import UIKit

class TableViewController: UIViewController {

    private var tableView: TableView? {
        guard isViewLoaded else { return nil }
        return view as? TableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 0.96, green: 0.96, blue: 0.98, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}
