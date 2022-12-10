//
//  MainViewController.swift
//  Coordinator-Practice
//
//  Created by EUNJU on 2022/12/09.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    // MARK: Properties
    private let firstButton = UIButton()
    private let secondButton = UIButton()
    weak var coordinator: MainCoordinator?
    
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
        view.backgroundColor = .white
        firstButton.setTitle("첫번째 뷰로 이동", for: .normal)
        secondButton.setTitle("두번째 뷰로 이동", for: .normal)
        [firstButton, secondButton].forEach { $0.setTitleColor(.systemBlue, for: .normal) }
    }
    
    private func setLayout() {
        [firstButton, secondButton].forEach {
            view.addSubview($0)
        }
        
        firstButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(20)
        }
        
        secondButton.snp.makeConstraints {
            $0.top.equalTo(firstButton.snp.bottom).offset(10)
            $0.centerX.equalTo(firstButton.snp.centerX)
            $0.width.equalTo(200)
            $0.height.equalTo(20)
        }
    }
    
    // MARK: Action
    private func tapButtonAction() {
        firstButton.rx.tap.asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                self?.coordinator?.pushFirstViewController()
            })
            .disposed(by: disposeBag)
        
        secondButton.rx.tap.asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                self?.coordinator?.pushSecondViewController()
            })
            .disposed(by: disposeBag)
    }
}

