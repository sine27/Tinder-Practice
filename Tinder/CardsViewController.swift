//
//  CardsViewController.swift
//  Tinder
//
//  Created by Shayin Feng on 4/6/17.
//  Copyright © 2017 Shayin Feng. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    var start: CGPoint!
    var end: CGPoint!
    var length: CGFloat!
    var type = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "nav_bar"), for: .default)
        
        cardInitialCenter = myImageView.center
        length = myImageView.frame.width * 0.5
        myImageView.layer.cornerRadius = 10
        initVar()
        // Initialize a scale transform
        //view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        // Update the scale from an existing transform
        //view.transform = view.transform.scaledBy(x: 0.5, y: 0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        myImageView.transform = CGAffineTransform.identity
        if segue.identifier == "segue" {
            let vc = segue.destination as! ProfileViewController
            vc.image = myImageView.image!
        }
    }
    
    @IBAction func dragAction(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            start = location
            print("start location: \(start!) \(cardInitialCenter.y)")
            
            if start.y < cardInitialCenter.y { // top half
                type = 0
            }
            else { // bottom half
                type = 1
            }
            
        }
        else if sender.state == .changed {
            print("location: \(location) velocity: \(velocity)  translation:\(translation)")
            
            if type == 0 {
                //myImageView.transform = view.transform.rotated(by: CGFloat(45 * Double.pi / 180))
                myImageView.transform = view.transform.translatedBy(x: translation.x, y: translation.y)
                myImageView.transform = myImageView.transform.rotated(by: translation.x * 0.005)
                
            } else if type == 1 {
                myImageView.transform = view.transform.translatedBy(x: translation.x, y: translation.y)
                myImageView.transform = myImageView.transform.rotated(by: -translation.x * 0.005)
            }
            
            if (translation.y < -30 || translation.y > 30), velocity.y > 350 {
                performSegue(withIdentifier: "segue", sender: self)
            }
            
        }
        else if sender.state == .ended {
            end = location
            print("start location: \(start!) end location: \(end!)")
            
            if sqrt(translation.x * translation.x) > 80 {
                myImageView.image = nil
            }
            myImageView.transform = CGAffineTransform.identity
            
            initVar()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        myImageView.image = #imageLiteral(resourceName: "ryan")
    }
    
    func initVar() {
        start = cardInitialCenter
        end = cardInitialCenter
    }
}
