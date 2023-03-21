//
//  ProfileHeader.swift
//  TwitterClone
//
//  Created by MacBookPro on 20/03/23.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
    private let joinedDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Joined May 2021"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let joinDateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "calendar",withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        imageView.tintColor = .secondaryLabel
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userBioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.text = "iOS Developer"
        label.textColor = .label
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@amrhossam96"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Amr"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let profileAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private let profileHeaderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "header")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .systemGray3
        addSubview(profileHeaderImageView)
        addSubview(profileAvatarImageView)
        addSubview(displayNameLabel)
        addSubview(userNameLabel)
        addSubview(userBioLabel)
        addSubview(joinDateImageView)
        addSubview(joinedDataLabel)
        
        configureConstraints()
    }
    
    private func  configureConstraints(){
        
        let profileHeaderImageConstraints = [
            profileHeaderImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileHeaderImageView.topAnchor.constraint(equalTo: topAnchor),
            profileHeaderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileHeaderImageView.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        let profileAvatarImageViewConstraints = [
            profileAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profileAvatarImageView.centerYAnchor.constraint(equalTo: profileHeaderImageView.bottomAnchor,constant: 10),
            profileAvatarImageView.widthAnchor.constraint(equalToConstant: 80),
            profileAvatarImageView.heightAnchor.constraint(equalToConstant: 80)
        ]
        
        let displayNameLabelConstraints = [
            displayNameLabel.leadingAnchor.constraint(equalTo: profileAvatarImageView.leadingAnchor),
            displayNameLabel.topAnchor.constraint(equalTo: profileAvatarImageView.bottomAnchor, constant: 20)
        ]
        
        let usernameLabelConstraints = [
            userNameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            userNameLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 5)
        ]
        
        let userBioLabelConstraints = [
            userBioLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            userBioLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            userBioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ]
        
        let joinDateImageViewConstraints = [
            joinDateImageView.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            joinDateImageView.topAnchor.constraint(equalTo: userBioLabel.bottomAnchor, constant: 5)
        ]
        
        let joinedDataLabelConstraints = [
            joinedDataLabel.leadingAnchor.constraint(equalTo: joinDateImageView.trailingAnchor, constant: 2),
            joinedDataLabel.bottomAnchor.constraint(equalTo: joinDateImageView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(profileHeaderImageConstraints)
        NSLayoutConstraint.activate(profileAvatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(userBioLabelConstraints)
        NSLayoutConstraint.activate(joinDateImageViewConstraints )
        NSLayoutConstraint.activate(joinedDataLabelConstraints)

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
