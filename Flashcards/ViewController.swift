//
//  ViewController.swift
//  Flashcards
//
//  Created by Jeff Saquipulla on 9/18/22.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    
}

