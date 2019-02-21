//
//  DataManager.swift
//  Winstagram
//
//  Created by objcmate on 2/19/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import Foundation
import FirebaseDatabase


final class DataManager {
    static let shared = DataManager()
    var databaseRef: DatabaseReference!
    var Home = HomeViewController()

    
    // set DB ref
    private init() {
        databaseRef = Database.database().reference()
    }
    
    
    // create post
    func createPost(post: PostModel) {
        // create post in firebase
    }
    
    
    // get posts
    func fetchPosts(completion: @escaping (_ result: Array<Any>)->()) {
        self.databaseRef.child("posts").observeSingleEvent(of: .value, with: { (snapshot) in
            let dict = snapshot.value as! [String: [String: AnyObject]]
            for snap in dict {
                self.Home.setPosts(post: (PostModel(postID: snap.key, dict: snap.value).get()))
            }
            
            completion(self.Home.getPosts())
        })
    }
}












/*
 
 self.databaseRef.child("posts").observe(.value) { (snapshot) in
 
 }

 
 
 
 
 final class DataManager {
    var userUID: String?
    
 
    // make post
    func createPost(post: PostModel, image: UIImage, progress: @escaping (Double) -> (), callback: @escaping (Bool) -> ()) {
        
    }
    
    
    // create feed
    func fetchHome(callback: @escaping ([PostModel]) -> ()) {
        let ref = databaseRef.child("posts")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            let items: [PostModel] = snapshot.children.compactMap { child in
                guard let child = child as? DataSnapshot else {
                    return nil
                }

                return PostModel.init(snapshot: child)
            }
            
            DispatchQueue.main.async {
                callback(items.reversed())
            }
        })
    }
}*/
