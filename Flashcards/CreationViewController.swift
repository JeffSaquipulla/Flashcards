//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Jeff Saquipulla on 10/2/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss (animated: true)
        //Void dismiss(animated: Bool, completion: (()->Void)?)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = questionTextField.text!
        
        let answerText = answerTextField.text!
        
        flashcardsController.updateFlashcard(question: questionText, answer: answerText)
        
        dismiss(animated: true)
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
