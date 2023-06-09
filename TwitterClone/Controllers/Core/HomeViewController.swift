//
//  Home ViewController.swift
//  TwitterClone
//
//  Created by MacBookPro on 17/03/23.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    private func configureNavigationBar(){
        let size:CGFloat = 36
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "twitterLogo")
        
        let middleView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        middleView.addSubview(logoImageView)
        navigationItem.titleView = middleView
        
        let profileImage = UIImage(systemName: "person")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(didTabProfile))
    }
    
    @objc private func didTabProfile(){
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true )
    }
    
    private let timelineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self , forCellReuseIdentifier: TweetTableViewCell.indentifier)
        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
        timelineTableView.delegate = self
        timelineTableView .dataSource = self
        configureNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        if Auth.auth().currentUser == nil {
            let vc = UINavigationController(rootViewController: OnboardingViewController()
            )
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: false)
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.indentifier, for: indexPath)  as? TweetTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
     
}

extension HomeViewController: TweetTableViewCellDelegate{
    func tweetTableViewCellDidTapReply() {
        print("reply")
    }
    
    func tweetTableViewCellDidTapRetweet() {
        print("retweet")
    }
    
    func tweetTableViewCellDidTapLike() {
        print("Like")
    }
    
    func tweetTableViewCellDidTapShare() {
        print("Share")
    }
    
    
}
