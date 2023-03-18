//
//  Home ViewController.swift
//  TwitterClone
//
//  Created by MacBookPro on 17/03/23.
//

import UIKit

class Home_ViewController: UIViewController {
    
    private let timelineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
        timelineTableView.delegate = self
        timelineTableView .dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
    }
    
}

extension Home_ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Tweet"
        return cell
    }
     
}
