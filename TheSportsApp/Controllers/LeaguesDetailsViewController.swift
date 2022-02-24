//
//  LeaguesDetailsViewController.swift
//  TheSportsApp
//
//  Created by Mohamed Maged on 23/02/2022.
//

import UIKit

class LeaguesDetailsViewController: UIViewController {

    @IBOutlet weak var addToFavoriteImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        addToFavoriteImageView.isUserInteractionEnabled = true
        addToFavoriteImageView.addGestureRecognizer(tapGestureRecognizer)
    
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        
        self.dismiss(animated: true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
