//
//  ViewController.swift
//  Word Garden
//
//  Created by Cooper Schmitz on 1/30/20.
//  Copyright © 2020 Cooper Schmitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessedCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    @IBOutlet weak var wordsInGameLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var lossesLabel: UILabel!
    
    var wordToGuess = ["CAT", "DOG", "BAYLOR", "COOPER", "YESTERDAY", "SWIMMING", "CIRCLES", "SNOWBOARDING"]
    var lettersGuessed = ""
    
    let maxNumberOfWrongGuesses = 8
    var wrongGuessRemaining = 8
    var guessCount = 0
    var arrayNumber = 0
    var winsNumber = 0
    var lossesNumber = 0
    var wordsRemainingNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        wordsRemainingNumber = wordToGuess.count
        formatUserGuessLabel()
    }
    
    func updateTrackers() {
       wordsInGameLabel.text = "Words in Game: \(wordToGuess.count)"
        winsLabel.text = "Wins: \(winsNumber)"
        lossesLabel.text = "Losses: \(lossesNumber)"
        wordsRemainingLabel.text = "Words Left: \(wordsRemainingNumber)"
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
            guessedLetterField.text = ""
    }

    func formatUserGuessLabel() {
        var revealedWord = ""
              lettersGuessed += guessedLetterField.text!
              
              for letter in wordToGuess[arrayNumber] {
                  if lettersGuessed.contains(letter) {
                      revealedWord = revealedWord + " \(letter)"
                  } else {
                      revealedWord = revealedWord + " _"
                  }
              }
               
              revealedWord.removeFirst(1)
              userGuessLabel.text = revealedWord
            updateTrackers()
    }

    func guessALetter() {
      formatUserGuessLabel()
        guessCount += 1
        // decrements the wrongGuessesRemaining and shows the next flower image with one less pedal
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess[arrayNumber].contains(currentLetterGuessed){
            wrongGuessRemaining -= 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessRemaining)")
        }
        
        let revealedWord = userGuessLabel.text!
         let guess = (guessCount == 1 ? "guess":"guesses")
        // stop game with 0 guesses remaining
        if wrongGuessRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            lossesNumber += 1
           //says that even if there are no dashes, then it was correctly guessed
        } else if !revealedWord.contains("_") {
            //youve won!
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessedCountLabel.text = "You've Got It! Congratulations it only took you \(guessCount) \(guess) to get the word!"
            arrayNumber += 1
            winsNumber += 1
        } else {
           //update guess count
//            if guessCount == 1
//                guessedCountLabel.text = "You've made \(guessCount)              Guess"
//
//            } else {
//            guessedCountLabel.text = "You've made \(guessCount)                   Guesses"
            // USING TERNARY OPERATOR
            guessedCountLabel.text = "You've made \(guessCount) \(guess)!"
            }
        if arrayNumber == wordToGuess.count {
            guessedCountLabel.text = "You've tried all the words! Restart from the beginning?"
            
        }
        }

    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            //if both the text and the last character is not nil, then we assign the last character to guessedLetterField.text
            guessedLetterField.text = String(letterGuessed)
            // remember we have to assign the string element to the character - can also use string interpolation
            guessLetterButton.isEnabled = true
        } else {
            //if one of the types above (.text or .last), then we go to this step
            guessLetterButton.isEnabled = false
            // this disables the button so it WILL NOT BE ABLE TO BE CLICKED
            // this is what happens when there is no character in the letterfield

            
        }
    }
    
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        guessedLetterField.isEnabled = true
        wrongGuessRemaining = maxNumberOfWrongGuesses
        playAgainButton.isHidden = true
        flowerImageView.image = UIImage(named: "flower8")
        lettersGuessed = ""
        guessedCountLabel.text = "You've Made 0 Guesses"
        guessCount = 0
        wordsRemainingNumber = wordToGuess.count - 1
        if arrayNumber == wordToGuess.count{
            arrayNumber = 0
            wordsRemainingNumber = 0
            winsNumber = 0
            lossesNumber = 0
        }
    formatUserGuessLabel()
        //need to have another array of words
    }
}

//QUESTION FOR OFFICE HOURS: IF WE ARE DOING A RANDOM SET OF NUMBERS, HOW WOULD WE GET RIDE OF A NUMBER AFTER IT HAD BEEN SELECTED AT RANDOM
//IE: IF WE HAVE 1...10 AND 10 IS SELECTED IT BECOMES 1...9 ETC
