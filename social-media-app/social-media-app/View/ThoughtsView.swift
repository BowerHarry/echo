//
//  ThoughtsView.swift
//  social-media-app
//
//  Created by Harry Bower on 20/01/2024.
//

import UIKit

class ThoughtsView: UIView {
    
    let timelineVerticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 4, bottom: 20, trailing: 16)
        //stack.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return stack
    }()
    
    let thoughtHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        //stack.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        stack.alignment = .firstBaseline
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let thoughtContentVerticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 4, bottom: 8, trailing: 16)
        //stack.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return stack
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //label.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)

        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //label.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)

        return label
    }()
    
    let createdDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //label.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return imageView
    }()
    
    let thoughtFirstRowHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        //stack.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return stack
    }()
    
    let usernameFullNameHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .firstBaseline
        stack.distribution = .fillProportionally
        stack.spacing = 2
        //stack.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        return stack
    }()
    
    let profilePictureVerticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .firstBaseline
        stack.distribution = .equalSpacing
        stack.layoutMargins = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        //stack.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        return stack
    }()
    
    let thoughtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    


    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        addSubview(timelineVerticalStackView)
        [profilePictureVerticalStackView, thoughtContentVerticalStackView].forEach{
            timelineVerticalStackView.addArrangedSubview(thoughtHorizontalStackView)
            thoughtHorizontalStackView.addArrangedSubview($0)
        }
        [profileImageView].forEach{profilePictureVerticalStackView.addArrangedSubview($0)}
        thoughtContentVerticalStackView.addArrangedSubview(thoughtFirstRowHorizontalStackView)
        thoughtFirstRowHorizontalStackView.addArrangedSubview(usernameFullNameHorizontalStackView)
        [fullNameLabel, usernameLabel].forEach{
            usernameFullNameHorizontalStackView.addArrangedSubview($0)}
        [usernameFullNameHorizontalStackView, createdDateLabel].forEach {thoughtFirstRowHorizontalStackView.addArrangedSubview($0)}
        [thoughtLabel].forEach {
            thoughtContentVerticalStackView.addArrangedSubview($0)
        }
        thoughtContentVerticalStackView.addArrangedSubview(SeperatorView())
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            timelineVerticalStackView.topAnchor.constraint(equalTo: topAnchor),
            timelineVerticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            timelineVerticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            timelineVerticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profilePictureVerticalStackView.widthAnchor.constraint(equalToConstant: 50),
            profilePictureVerticalStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
 
    func getDate(d: String) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withTime, .withSpaceBetweenDateAndTime, .withFractionalSeconds, .withColonSeparatorInTime, .withDashSeparatorInDate]
        let date = formatter.date(from: d)
        if date != nil {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm E"
            let formattedDate = dateFormatter.string(from: date!)
            print(formattedDate)
            return formattedDate
        }
        else {
            return "00:00"
        }
    }
    
    func set(_ thought: ThoughtModel) {
        usernameLabel.text = "@" + String(thought.userName)
        fullNameLabel.text = String(thought.fullName)
        createdDateLabel.text = getDate(d: thought.createdDate.date)
        thoughtLabel.text = thought.text
        profileImageView.image = UIImage(named: "pp.png")
    }
    
}

class SeperatorView: UIView {
    init() {
            super.init(frame: .zero)
            setUp()
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            setUp()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setUp() {
            backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }

        override var intrinsicContentSize: CGSize {
            return CGSize(width: UIView.noIntrinsicMetric, height:0.5)
        }
}
