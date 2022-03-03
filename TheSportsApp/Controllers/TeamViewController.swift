//
//  TeamViewController.swift
//  TheSportsApp
//
//  Created by Mohamed Maged on 02/03/2022.
//

import UIKit
import Kingfisher

class TeamViewController: UIViewController {
    
    var teamDetails:TeamsData?

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = (teamDetails?.strStadiumThumb) ?? URL(string: "")
        let processor = DownsamplingImageProcessor(size: stadiumImage.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        stadiumImage.kf.indicatorType = .activity
        stadiumImage.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
            
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        let url1 = (teamDetails?.strTeamBadge) ?? URL(string: "")
        let processor1 = DownsamplingImageProcessor(size: teamBadge.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        teamBadge.kf.indicatorType = .activity
        teamBadge.kf.setImage(
            with: url1,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            let url2 = (self.teamDetails?.strTeamJersey) ?? URL(string: "")
            let processor2 = DownsamplingImageProcessor(size: self.teamJersey.bounds.size)
                         |> RoundCornerImageProcessor(cornerRadius: 20)
            self.teamJersey.kf.indicatorType = .activity
            self.teamJersey.kf.setImage(
                with: url2,
                placeholder: UIImage(named: "placeholderImage"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            {
                result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            
        }
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            let url4 = (self.teamDetails?.strTeamLogo) ?? URL(string: "")
            let processor4 = DownsamplingImageProcessor(size: self.teamLogo.bounds.size)
                         |> RoundCornerImageProcessor(cornerRadius: 20)
            self.teamLogo.kf.indicatorType = .activity
            self.teamLogo.kf.setImage(
                with: url4,
                placeholder: UIImage(named: "placeholderImage"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            {
                result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            
        }
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            let url3 = (self.teamDetails?.strTeamBanner) ?? URL(string: "")
            let processor3 = DownsamplingImageProcessor(size: self.banner.bounds.size)
                         |> RoundCornerImageProcessor(cornerRadius: 20)
            self.banner.kf.indicatorType = .activity
            self.banner.kf.setImage(
                with: url3,
                placeholder: UIImage(named: "placeholderImage"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            {
                result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            
        }
            
        }
        formedYear.text = teamDetails?.intFormedYear
        stadiumName.text = teamDetails?.strStadium
        capacityStadium.text = teamDetails?.intStadiumCapacity
        
    }
    
    @IBOutlet weak var stadiumImage: UIImageView!
    @IBOutlet weak var teamBadge: UIImageView!
    @IBOutlet weak var teamJersey: UIImageView!
    @IBOutlet weak var formedYear: UILabel!
    @IBOutlet weak var capacityStadium: UILabel!
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBAction func websiteAction(_ sender: Any) {
        let fullURL = "https://\(String(describing: teamDetails?.strWebsite!))"
        if let url = URL(string: fullURL){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func facebookAction(_ sender: Any) {
        let fullURL = "https://\(String(describing: teamDetails?.strFacebook!))"
        if let url = URL(string: fullURL){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func twitterAction(_ sender: Any) {
        let fullURL = "https://\(String(describing: teamDetails?.strTwitter!))"
        if let url = URL(string: fullURL){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func instagramAction(_ sender: Any) {
        let fullURL = "https://\(String(describing: teamDetails?.strInstagram!))"
        if let url = URL(string: fullURL){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func youtubeAction(_ sender: Any) {
        let fullURL = "https://\(String(describing: teamDetails?.strYoutube!))"
        if let url = URL(string: fullURL){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBOutlet weak var banner: UIImageView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
