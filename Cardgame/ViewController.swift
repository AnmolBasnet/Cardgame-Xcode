//
//  ViewController.swift
//  Cardgame
//
//  Created by Anmol's Mac on 7/26/20.
//  Copyright © 2020 Anmol Basnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftimageview: UIImageView!
    
    
    @IBOutlet weak var rightimageview: UIImageView!
    
    
    @IBOutlet weak var playerscorelabel: UILabel!
    
    @IBOutlet weak var cpuscorelabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dealbutton(_ sender: Any) {
        
        //Here the Int data type is used to extract the random function using "Int.random" where the range of card is exposed inclusively.
        
        let leftcardnumber = Int.random(in: 2...14)
        let rightcardnumber = Int.random(in: 2...14)
        
        
        //(This code will assign left imageview to the image func where all the images of card exists and then change it to the provided card name)
        
        //Eg:leftimageview.image = UIImage(named: "card12")
        
        leftimageview.image = UIImage(named: "card\(leftcardnumber)")
        rightimageview.image = UIImage(named: "card\(rightcardnumber)")
        
        if leftcardnumber > rightcardnumber{
            //Player Wins
            leftScore += 1
            playerscorelabel.text = String(leftScore)
        }
        
        if leftcardnumber < rightcardnumber{
            
            //CPU Wins
            rightScore += 1
            cpuscorelabel.text = String(rightScore)
             
        }
        else{
            //Its a Tie
        }
        
    }
    
    
}

