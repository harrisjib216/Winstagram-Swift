//
//  HomeViewController.swift
//  Winstagram
//
//  Created by objcmate on 2/4/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit
import NVActivityIndicatorView
import FirebaseDatabase
import FirebaseAuth


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var homeTable: UITableView!
    var posts:Array<Any> = []
    
    
    // view loads - init table
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTable.delegate = self
        self.homeTable.dataSource = self
        loadData()
    }
    
    
    
    // load data
    func loadData() {
        DataManager.shared.fetchPosts() { (result) -> () in
            self.posts = result
            self.homeTable.reloadData()
        }
    }
    
    
    // set posts
    func setPosts(post: Array<Any>) {
        self.posts.append(post)
    }
    
    
    // get posts
    func getPosts() -> Array<Any> {
        return self.posts
    }
    
    
    // make cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    // render cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeTableViewCell
        cell.render(data: posts[indexPath.row] as! Array<Any>)

        return cell
    }
    
    
    // log out
    @IBAction func logout(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        do {
            try Auth.auth().signOut()
            self.handleNav(view: WelcomeViewController())
        } catch let err as NSError {
            alert.title = "Uh oh!"
            alert.message = "\(err.localizedDescription)"
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    // nav to new screen
    func handleNav(view: UIViewController) {
        self.present(view, animated: true, completion: nil)
    }
}



// var loadingView: NVActivityIndicatorView!
// loadingView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), type: .lineScaleParty, color: UIColor.red)
// loadingView.startAnimating()
// self.loadingView.stopAnimating()