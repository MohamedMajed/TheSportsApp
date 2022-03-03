//
//  LeaguesTableViewController.swift
//  TheSportsApp
//
//  Created by Mohamed Maged on 23/02/2022.
//

import UIKit
import Alamofire
import Kingfisher

class LeaguesTableViewController: UITableViewController {
    let indicator = UIActivityIndicatorView(style: .large)
    var Leagues = [[String: String?]]()
    
    var sport: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.indicator.center = self.view.center
        self.view.addSubview(indicator)
        self.indicator.startAnimating()
        self.indicator.color = .yellow
        
        tableView.register(UINib(nibName: "CustomLeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaguesCell")
        AlamofireMethod(strSport: sport!)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of leagues egual to : \(Leagues.count)")
        var counts = Leagues.count
        return Leagues.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell", for: indexPath) as! CustomLeaguesTableViewCell
        
        let url = URL(string: (Leagues[indexPath.row]["strBadge"]! ?? ""))!
        cell.leagueBadge.kf.setImage(with: url)
       
        cell.leagueName.text = Leagues[indexPath.row]["strLeague"] as! String
        cell.layer.borderWidth = 2
        cell.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        cell.layer.cornerRadius = 20

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leaguesDetails = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsViewController") as! LeaguesDetailsViewController
        
        leaguesDetails.league = Leagues[indexPath.row]["strLeague"] as! String
        leaguesDetails.idLeague = Leagues[indexPath.row]["idLeague"] as! String
        leaguesDetails.badge = Leagues[indexPath.row]["strThumb"] as? String
        leaguesDetails.youtubeUrl = Leagues[indexPath.row]["strYoutube"] as! String
        tableView.deselectRow(at: indexPath, animated: false)
        self.present(leaguesDetails, animated: true, completion: nil)
    }

    func AlamofireMethod (strSport: String)-> Void{
        AF.request("https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?c=England&s=\(strSport)"
        )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    let data = response.value
                    
                    do{
                        let  decoder:  JSONDecoder  = JSONDecoder();
                        let array = try decoder.decode(Welcome.self , from: data!)
                        self.Leagues.removeAll();
                        self.Leagues = array.countrys

                        print("Sports count \(self.Leagues)")
                        /// Reload Data into grid
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            self.indicator.stopAnimating()
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
