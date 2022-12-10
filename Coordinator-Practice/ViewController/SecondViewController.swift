//
//  SecondViewController.swift
//  Coordinator-Practice
//
//  Created by EUNJU on 2022/12/10.
//

import UIKit

import SnapKit

class SecondViewController: UIViewController {
    
    // MARK: Properties
    private let titleLabel = UILabel()
    weak var coordinator: SecondCoordinator?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    // MARK: UI
    private func setStyle() {
        view.backgroundColor = .systemPink
        titleLabel.text = "두번째 뷰"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private func setLayout() {
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
