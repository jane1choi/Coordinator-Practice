//
//  FirstViewController.swift
//  Coordinator-Practice
//
//  Created by EUNJU on 2022/12/10.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {

    // MARK: Properties
    private let titleLabel = UILabel()
    private let nextButton = UIButton()
    weak var coordinator: FirstCoordinator?
    
    let disposeBag = DisposeBag()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        tapButtonAction()
    }
    
    // MARK: UI
    private func setStyle() {
        view.backgroundColor = .yellow
        titleLabel.text = "첫번째 뷰"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.systemBlue, for: .normal)
    }
    
    private func setLayout() {
        [titleLabel, nextButton].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(titleLabel.snp.centerX)
        }
    }
    
    // MARK: Action
    private func tapButtonAction() {
        nextButton.rx.tap.asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                self?.coordinator?.pushNextViewController()
            })
            .disposed(by: disposeBag)
    }
}
