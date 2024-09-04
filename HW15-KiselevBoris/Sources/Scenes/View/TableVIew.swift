//
//  TableVIew.swift
//  HW15-KiselevBoris
//
//  Created by Борис Киселев on 19.06.2022.
//

import UIKit

class TableView: UIView {
    // MARK: - Private properties
    private lazy var model = TableModel.createModel()

    
    // MARK: - View
    lazy var settingsTable = UITableView(frame: .zero, style: UITableView.Style.insetGrouped)
    
    // MARK: - View setup
    private func setTableView() {
        settingsTable.delegate = self
        settingsTable.dataSource = self
        settingsTable.estimatedSectionHeaderHeight = 0.5
        settingsTable.sectionHeaderTopPadding = 1
        settingsTable.tableHeaderView?.backgroundColor = UIColor(displayP3Red: 0.96, green: 0.96, blue: 0.98, alpha: 1)
    }
    
    // MARK: - Initials
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupHierarchy()
        setupLayout()
        settingsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - SetupHierarchy and Layout
    func setupHierarchy() {
        addSubview(settingsTable)
        setTableView()
    }
    
    func setupLayout() {
        settingsTable.translatesAutoresizingMaskIntoConstraints = false
        settingsTable.topAnchor.constraint(equalTo: topAnchor).isActive = true
        settingsTable.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        settingsTable.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        settingsTable.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

    // MARK: - Extension - Cell's settings
extension TableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.image = model[indexPath.section].image[indexPath.row]
        content.text = model[indexPath.section].text[indexPath.row]
        content.secondaryText = model[indexPath.section].secondText[indexPath.row]
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 2
        
        let switchForCell = UISwitch(frame: .zero)
        switchForCell.setOn(false, animated: true)
        
        cell.contentConfiguration = content
        
        if content.text == "Авиарежим" || content.text == "VPN" {
            cell.accessoryView = switchForCell
        } else {
            cell.accessoryView = .none
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
}

extension TableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        settingsTable.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка \(model[indexPath.section].text[indexPath.row])")
    }
}



