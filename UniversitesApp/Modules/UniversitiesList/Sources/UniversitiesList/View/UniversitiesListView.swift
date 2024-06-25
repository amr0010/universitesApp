//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import UIKit
import Models

public protocol UniversitiesListViewProtocol: AnyObject {
    var presenter: UniversitiesListPresenterProtocol? { get set }
    func showUniversities(_ universities: [University])
    func showError(_ error: String)
}

public class UniversitiesListView: UIViewController, UniversitiesListViewProtocol {
    public var presenter: UniversitiesListPresenterProtocol?
    var universities: [University] = []
    
    let tableView = UITableView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRefreshButton()
        presenter?.viewDidLoad()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupRefreshButton() {
        let refreshButton = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refreshButtonTapped))
        navigationItem.rightBarButtonItem = refreshButton
    }
    
    @objc func refreshButtonTapped() {
        presenter?.refreshButtonTapped()
    }
    
    public func showUniversities(_ universities: [University]) {
        self.universities = universities
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    public func showError(_ error: String) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }
}

extension UniversitiesListView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = universities[indexPath.row].name
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let university = universities[indexPath.row]
        presenter?.showDetails(for: university)
    }
}
