//
//  HomeTableViewCell.swift
//  Winstagram
//
//  Created by objcmate on 2/4/19.
//  Copyright © 2019 objcmate. All rights reserved.
//
import UIKit
import FirebaseDatabase


class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var content: UITextView!
    var pressed:Bool = false
    var postID:String!
    
    
    // something
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // if cell is selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    // render each cell
    func render(data: Array<Any>) {
        // post set up
        self.postID = data[1] as! String
        
        // text
        self.nameLabel.text = data[2] as! String
        self.dateLabel.text = data[3] as! String
        self.winsLabel.text = "\(data[5])"
        self.content.text = data[6] as! String
        
        // images
        /*
          self.postID,
        self.profile,
          self.author,
          self.date,
        self.post,
          self.wins,
          self.desc
        */
    }
    
    
    // pressing wins button
    @IBAction func winBtn(_ sender: Any) {
        /*
        let wins:Int = Database.database().reference().child("posts/\(self.postID)").value(forKey: "wins") as! Int
        pressed = true
        if (pressed == true) {
            Database.database().reference().child("posts/\(self.postID)/wins").setValue((wins + 1))
            self.winsLabel.text = "\(wins + 1)"
        }
        else {
            Database.database().reference().child("posts/\(self.postID)/wins").setValue((wins - 1))
            self.winsLabel.text = "\(wins - 1)"
        }*/
    }
}
