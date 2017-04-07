//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Shayin Feng on 4/6/17.
//  Copyright © 2017 Shayin Feng. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var myNavigationBar: UIImageView!
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImageView.image = image
        let tap = UITapGestureRecognizer(target: self, action: #selector(goback))
        myNavigationBar.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goback() {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
