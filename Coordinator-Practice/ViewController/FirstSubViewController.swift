//
//  FirstSubViewController.swift
//  Coordinator-Practice
//
//  Created by EUNJU on 2022/12/10.
//

import UIKit

import SnapKit

class FirstSubViewController: UIViewController {

    // MARK: Properties
    private let titleLabel = UILabel()
    weak var coordinator: FirstCoordinator?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    // MARK: UI
    private func setStyle() {
        view.backgroundColor = .systemYellow
        titleLabel.text = "서브 뷰"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private func setLayout() {
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
