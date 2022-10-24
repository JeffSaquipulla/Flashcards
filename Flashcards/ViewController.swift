//
//  ViewController.swift
//  Flashcards
//
//  Created by Jeff Saquipulla on 9/18/22.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    //array to hold our flashcards
    var flashcards = [Flashcard]()
    //current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //read saved flashcards
        readSavedFlashcards()
        
        //updateFlashcard(question: "What color is a tigers fur ?", answer:"Orange")
        if flashcards.count == 0 {
        updateFlashcard(question: "How many stars does the american flag have?", answer:"50")
        }else {
            updateLabel()
            updateNextPrevButtons()
        }

        //logging to the console
        
    }

    @IBOutlet weak var card: UIView!
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        flipFlashcard()
        
        UIView.transition(with: card, duration: 0.3, options: .transitionFlipFromRight, animations: {self.frontLabel.isHidden = true})
    }
    
    
    func flipFlashcard(){
        frontLabel.isHidden = true
        backLabel.isHidden = false
    }
    
    
    func animateCardOut(){
        UIView.animate(withDuration: 0.3, animations:{
            self.card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)}, completion: {finished in
            //update label
            self.updateLabel()
            
            //run other animation
            self.animateCardIn()
        })
    }
    
    func animateCardIn(){
        
        //start on the right side (don't animate this
        card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        
        //animate card going back to its orginal position
        UIView.animate(withDuration:0.3){
            self.card.transform = CGAffineTransform.identity
        }
    }
        
    
    func updateFlashcard(question: String, answer: String) {
        
        let flashcard = Flashcard(question: question, answer: answer)
        
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer
        
        //Array to hold our flashcards
        flashcards.append(flashcard)
        print("Added a new Flashcard, take a look --> ", flashcards)
        
        print("🥸 Added new flashcard")
        print("🤓  We now have \(flashcards.count) flashcards")
        
        //update current index
        currentIndex = flashcards.count - 1
        print("🥳 our current index is \(currentIndex)")
        
        //update buttons
        updateNextPrevButtons()
        
        //update labels
        updateLabel()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationViewController = navigationController.topViewController as! CreationViewController
        
        creationViewController.flashcardsController = self
    }
    
   
    @IBOutlet weak var prevButton: UIButton!
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        //this will increase current index
        currentIndex = currentIndex - 1
        
        //update labels
        updateLabel()
        
        // update buttons
        updateNextPrevButtons()
        
        animateCardIn()
    }
   
    

    @IBOutlet weak var nextButton: UIButton!
    @IBAction func didTapOnNext(_ sender: Any) {
        
        //this will increase current index
        currentIndex = currentIndex + 1
        
        //update labels
        updateLabel()
        
        // update buttons
        updateNextPrevButtons()
        
        animateCardOut()


}
    
    
    func updateNextPrevButtons() {
        //disable next button if at the end
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false
        }else {
            nextButton.isEnabled = true
        }
        
        //disable prev button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabel(){
        // get current flashcard
        let currentFlashcard = flashcards [currentIndex]
        
        //update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    
    
    func saveAllFlashcardsToDisk(){
        UserDefaults.standard.set(flashcards, forKey: "Flashcard")
        
        //from flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
    }
        //save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
               
               // log
               print(" 🥳 Flashcards saved to user defaults")
        
    }
    
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String : String]] {
                    let savedCards = dictionaryArray.map {dictionary -> Flashcard in
                    return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
        }
            flashcards.append(contentsOf: savedCards)

        }
    
    }
}
