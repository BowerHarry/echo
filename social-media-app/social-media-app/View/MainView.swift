//
//  MainView.swift
//  social-media-app
//
//  Created by Harry Bower on 20/01/2024.
//

import UIKit

class MainView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .white
        addSubview(stackView)
        setConstaints()
        
    }
    
    func setConstaints() {
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                //stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
    
    func update(with data: [ThoughtModel]) {
        data.forEach {
            let view = ThoughtsView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.set($0)
            stackView.addArrangedSubview(view)
        }
    }
}

