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
        backLabel.isHidden = false 
    }
    
    func updateFlashcard(question: String, answer: String) {
       //updateFlashcard(question: "Is the moon considered a star ", answer: "yes it is")
        frontLabel.text = question
        backLabel.text = answer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationViewController = navigationController.topViewController as! CreationViewController
        
        creationViewController.flashcardsController = self
    }
    
}

