//
//  CustomLeaguesTableViewCell.swift
//  TheSportsApp
//
//  Created by Mohamed Maged on 23/02/2022.
//

import UIKit

class CustomLeaguesTableViewCell: UITableViewCell {
    var teamDetail:TeamsData?
    
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueBadge: UIImageView!
    
    @IBAction func youtubeTapped(_ sender: UIButton) {
//        let fullURL = "https://\(String(describing: teamDetail?.strYoutube!))"
        let myURL = "https://www.youtube.com/channel/UCG5qGWdu8nIRZqJ_GgDwQ-w"
        if let url = URL(string: myURL){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0))
        
        leagueBadge.layer.cornerRadius = 70
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        
    
    }
    
}
