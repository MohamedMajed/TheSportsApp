//
//  LeaguesDetailsViewController.swift
//  TheSportsApp
//
//  Created by Mohamed Maged on 23/02/2022.
//

import UIKit
import Alamofire
import Kingfisher

class LeaguesDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var league: String?
    var idLeague: String?
    var badge:String?
    var youtubeUrl:String?
    var upComingEvents = [UpComingEventData]()
    var latestResultsEvents = [LatestResultsData]()
    var teams = [TeamsData]()
    
    
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var addToFavoriteImageView: UIImageView!
    @IBOutlet weak var upComingDate: UILabel!
    @IBOutlet weak var upComingTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        addToFavoriteImageView.isUserInteractionEnabled = true
        addToFavoriteImageView.addGestureRecognizer(tapGestureRecognizer)
        
        fetchUpcoming(strLeague: league ?? "")
        fetchLatestResults(idLeague: idLeague ?? "")
        fetchTeams(strLeague: league ?? "")
        leagueName.text = league
    
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        
        saveLeagues()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func saveLeagues(){
        
        let favLeague = Favourite(context: context)
        favLeague.leagueName = league
        print(league)
        favLeague.leagueBadge = badge
        print(badge)
        favLeague.youtubeURL = youtubeUrl
        print(youtubeUrl)
        try? context.save()
    }
    
    @IBOutlet weak var teamsCollectionViewController: UICollectionView!
    @IBOutlet weak var latestResultCollectionViewController: UICollectionView!
    @IBOutlet weak var upComingCollectionViewController: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case upComingCollectionViewController:
            return upComingEvents.count
        case latestResultCollectionViewController:
            return latestResultsEvents.count
        default:
            return teams.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case upComingCollectionViewController:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpComingCollectionViewCell

            let url = URL(string: upComingEvents[indexPath.row].strThumb)
            let processor = DownsamplingImageProcessor(size: cell.upComingImage.bounds.size)
                         |> RoundCornerImageProcessor(cornerRadius: 20)
            cell.upComingImage.kf.indicatorType = .activity
            cell.upComingImage.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "photo"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ]){
                    result in
                    switch result {
                    case .success(let value):
                        print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    case .failure(let error):
                        print("Job failed: \(error.localizedDescription)")
                    }
                }
            cell.layer.cornerRadius = 30
            cell.layer.borderWidth = 3
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            cell.upComingDate.text = upComingEvents[indexPath.row].dateEvent
            cell.upComingTime.text = upComingEvents[indexPath.row].strTime
            return cell
            
        case latestResultCollectionViewController:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestResultsCell", for: indexPath) as! LatestResultsCollectionViewCell
            
            cell.home.text = latestResultsEvents[indexPath.row].intHomeScore
            cell.away.text = latestResultsEvents[indexPath.row].intAwayScore
            
            
            let url = URL(string: latestResultsEvents[indexPath.row].strThumb)
            let processor = DownsamplingImageProcessor(size: cell.latestResultsImage                      .bounds.size)
                         |> RoundCornerImageProcessor(cornerRadius: 20)
            cell.latestResultsImage.kf.indicatorType = .activity
            cell.latestResultsImage.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "photo"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ]){
                    result in
                    switch result {
                    case .success(let value):
                        print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    case .failure(let error):
                        print("Job failed: \(error.localizedDescription)")
                    }
                }
            cell.layer.cornerRadius = 30
            
            return cell
            
        case teamsCollectionViewController:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCollectionViewCell
           
            let url = (teams[indexPath.row].strTeamBadge) ?? URL(string: "")
            let processor = DownsamplingImageProcessor(size: cell.teamsImage                      .bounds.size)
                         |> RoundCornerImageProcessor(cornerRadius: 20)
            cell.teamsImage.kf.indicatorType = .activity
            cell.teamsImage.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "photo"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ]){
                    result in
                    switch result {
                    case .success(let value):
                        print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    case .failure(let error):
                        print("Job failed: \(error.localizedDescription)")
                    }
                }
            return cell
        default:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestResultsCell", for: indexPath) as! LatestResultsCollectionViewCell
        
        return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(collectionView == teamsCollectionViewController){
        let team = storyboard?.instantiateViewController(withIdentifier: "teamViewController") as! TeamViewController
        
        team.teamDetails = teams[indexPath.row]

        
        self.present(team, animated: true, completion: nil)
        }
    }
    
    func fetchUpcoming (strLeague: String)-> Void{
        let urlLeague = strLeague.replacingOccurrences(of: " ", with: "%20")
        print(urlLeague)
        AF.request("https://www.thesportsdb.com/api/v1/json/2/searchfilename.php?e=\(urlLeague)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    let data =  response.value
                    do{
                        let array = try JSONDecoder().decode([String:[UpComingEventData]].self, from: data!)
                        self.upComingEvents.removeAll()
                        self.upComingEvents = array["event"]!
                        print("\(self.upComingEvents)")
                        ///Reload Data into grid
                        DispatchQueue.main.async {
                            self.upComingCollectionViewController.reloadData()
                        }
                    }
                    catch let error as NSError {
                       print("Could not fetch Data of sports from server  \(error), \(error.userInfo)")
                    
                   }

                case .failure(_): break
                }
            }
    }
    func fetchLatestResults (idLeague: String)-> Void{
        let urlLeague = idLeague.replacingOccurrences(of: " ", with: "%20")
        print(urlLeague)
        AF.request("https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=\(urlLeague)&s=2021-2022")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    let data =  response.value
                    do{
                        let array = try JSONDecoder().decode([String:[LatestResultsData]].self, from: data!)
                        self.latestResultsEvents.removeAll()
                        self.latestResultsEvents = array["events"]!
                        ///Reload Data into grid
                        DispatchQueue.main.async {
                            self.latestResultCollectionViewController.reloadData()
                        }
                    }
                    catch let error as NSError {
                       print("Could not fetch Data of sports from server  \(error), \(error.userInfo)")
                    
                   }

                case .failure(_): break
                }
            }
    }
    
    func fetchTeams (strLeague: String)-> Void{
        let urlLeague = strLeague.replacingOccurrences(of: " ", with: "%20")
        print("-----------------------------------------------------")
        print(urlLeague)
        print("-----------------------------------------------------")
        AF.request("https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=\(urlLeague)")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    let data =  response.value
                    do{
                        let array = try JSONDecoder().decode([String:[TeamsData]].self, from: data!)
                        self.teams.removeAll()
                        self.teams = array["teams"]!
                        print("------------------------------------------------------")
                        print(array["teams"]!)
                        print(urlLeague)
                        print("------------------------------------------------------")
                        ///Reload Data into grid
                        DispatchQueue.main.async {
                            self.teamsCollectionViewController.reloadData()
                        }
                    }
                    catch let error as NSError {
                       print("Could not fetch Data of sports from server  \(error), \(error.userInfo)")
                    
                   }

                case .failure(_): break
            }
        }
    }
}
