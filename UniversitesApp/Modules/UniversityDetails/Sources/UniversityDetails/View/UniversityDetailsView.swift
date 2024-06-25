//
//  File.swift
//  
//
//  Created by Amr Magdy on 25/06/2024.
//

import UIKit
import Models

public protocol UniversityDetailsViewProtocol: AnyObject {
    var presenter: UniversityDetailsPresenterProtocol? { get set }
    func showUniversityDetails(_ details: University)
}

public class UniversityDetailsView: UIViewController, UniversityDetailsViewProtocol {
    public var presenter: UniversityDetailsPresenterProtocol?
    private var universityDetails: University?

    private let nameLabel = UILabel()
    private let countryLabel = UILabel()
    private var webPageButton: UIButton?

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(countryLabel)
        
        
       
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            countryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            countryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        
        ])
    }
    
    public func showUniversityDetails(_ details: University) {
        universityDetails = details
        nameLabel.text = "Name: \(details.name)"
        countryLabel.text = "Country: \(details.country)"
        
        if let webPageButton = webPageButton {
            webPageButton.removeFromSuperview()
        }
        
        if let webPage = details.webPages.first {
            let button = UIButton(type: .system)
            button.setTitle(webPage, for: .normal)
            button.addTarget(self, action: #selector(openWebPage(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(button)
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 20),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            webPageButton = button
        }
    }
    
    @objc private func openWebPage(_ sender: UIButton) {
        guard let webPage = sender.title(for: .normal), let url = URL(string: webPage) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
