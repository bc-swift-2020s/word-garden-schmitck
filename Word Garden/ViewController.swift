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
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
    }
    
func updateUIAfterGuess(){
    guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
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
        updateUIAfterGuess()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    

}

