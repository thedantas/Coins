//
//  SplashViewController.swift
//  Coins
//
//  Created by André  Costa Dantas on 25/01/23.
//

import UIKit
import Lottie

// MARK: - Protocol Splash
protocol SplashDelegate: AnyObject {
    func navigateToMain()
}

class SplashViewController: UIViewController {
    //MARK: - Layout
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.textColor = .white
        label.text = "Bem vindo ao Moedas"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Avançar", for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(touchedRegisterButton), for: .touchUpInside)
        return button
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 16)
        label.textColor = .white
        label.text = "Meu nome é André Dantas e esse aplicativo\n foi feito para o processo seletivo do\n Mercado Bitcoin"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var animationView: LottieAnimationView = {
        var view = LottieAnimationView()
        let jsonName = "coin"
        let animation = LottieAnimation.named(jsonName)
        view = LottieAnimationView(animation: animation)
        view.frame = CGRect(x: titleLabel.frame.midX + 100, y: 100, width: 200, height: 200)
        view.loopMode = .loop
        view.play()
        return view
    }()
    //MARK: - Variables
    weak var delegate: SplashDelegate?

    //MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSetup()
        setupContraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func layoutSetup() {
        view.backgroundColor = .lightOrangeColor
        view.addSubview(titleLabel)
        view.addSubview(nextButton)
        view.addSubview(animationView)
        view.addSubview(descriptionLabel)
        view.addSubview(nextButton)
    }
    func setupContraints() {
        let safeG = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeG.topAnchor, constant: 32.0),
            titleLabel.leadingAnchor.constraint(equalTo: safeG.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: safeG.topAnchor, constant: 250.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeG.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            nextButton.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 32),
            nextButton.trailingAnchor.constraint(equalTo: safeG.trailingAnchor, constant: -32),
            nextButton.bottomAnchor.constraint(equalTo: safeG.bottomAnchor, constant: -32.0),
            nextButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

    @objc private func touchedRegisterButton() {
        self.delegate?.navigateToMain()
    }
}
