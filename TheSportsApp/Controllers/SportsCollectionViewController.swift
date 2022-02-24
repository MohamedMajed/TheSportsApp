//
//  SportsCollectionViewController.swift
//  TheSportsApp
//
//  Created by Mohamed Maged on 22/02/2022.
//

import UIKit
import Alamofire
import Kingfisher


class SportsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
    var Sports :Array<SportElement> = [SportElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.title = "Sports"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
        
        AlamofireMethod()
        collectionView.alwaysBounceVertical = true
        
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Sports.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let url = URL(string: Sports[indexPath.row].strSportThumb)
        cell.sportImage.kf.setImage(with: url)
        
        
        cell.sportName.text = Sports[indexPath.row].strSport
        
        cell.sportName.layer.cornerRadius = cell.sportName.frame.size.height/2
        cell.sportName.layer.masksToBounds = true
        
        cell.sportImage.layer.cornerRadius = 25
        cell.sportImage.layer.borderColor = CGColor(red: 0.5, green: 0.5, blue: 1.0, alpha: 1.0)
        cell.sportImage.layer.borderWidth = 3
        
        
    
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leagues = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesTableVC") as! LeaguesTableViewController
        
        navigationController?.pushViewController(leagues, animated: true)
    }
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.alpha = 0.0
        cell.layer.transform = CATransform3DMakeScale(0.25, 0.25, 0.25)
        UIView.animate(withDuration: 0.25) {
            cell.contentView.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func rotated(){
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            print("sizeForItemAt")
//            
//            return CGSize(width: 10, height: 5)
//        }
    
    func AlamofireMethod ()-> Void{
        AF.request("https://www.thesportsdb.com/api/v1/json/2/all_sports.php"
        )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    let data =     response.value
                    
                    do{
                        let  decoder:  JSONDecoder  = JSONDecoder();
                        let array = try decoder.decode(Sport.self, from: data!);
                        self.Sports.removeAll();
                        self.Sports.append(contentsOf: array.sports);
                        print("Sports count \(self.Sports.count)");
                        /// Reload Data into grid
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
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
