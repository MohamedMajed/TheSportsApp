//
//  TabBarViewController.swift
//  TheSportsApp
//
//  Created by Mohamed Maged on 22/02/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tabBar.unselectedItemTintColor = UIColor(red: 17.0/255.0, green: 70.0/255.0, blue: 95.0/255.0, alpha: 0.4)
        
        self.tabBar.backgroundColor = UIColor(red: 17.0/255.0, green: 70.0/255.0, blue: 95.0/255.0, alpha: 0.5)
        // Do any additional setup after loading the view.
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
