//
//  ViewController.swift
//  project_2
//
//  Created by Ruçhan Talha Günay on 28.08.2022.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var currenAnswer = 0
    var answerCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany",
            "ireland", "italy", "monaco", "spain",
            "nigeria", "poland", "russia", "uk", "us"]
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showTheScore))


    
    button1.layer.borderWidth = 1
    button2.layer.borderWidth = 1
    button3.layer.borderWidth = 1
    
    button1.layer.borderColor = UIColor.lightGray.cgColor
    button2.layer.borderColor = UIColor.lightGray.cgColor
    button3.layer.borderColor = UIColor.lightGray.cgColor

    askQuestion()
}
    
    @objc func showTheScore(){
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        present(ac, animated: true)
        ac.dismiss(animated: true)
        
        
    }
    
    
    func askQuestion(action: UIAlertAction! = nil){
    countries.shuffle()
    currenAnswer = Int.random(in: 0...2)
        title = countries[currenAnswer].uppercased() + "   \(score)"
    
    button1.setImage(UIImage(named: countries[0]), for: .normal)
    button2.setImage(UIImage(named: countries[1]), for: .normal)
    button3.setImage(UIImage(named: countries[2]), for: .normal)

}
    func resetAll(action: UIAlertAction! = nil) {
         score = 0
         currenAnswer = 0
         answerCounter = 0
         askQuestion()
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        answerCounter += 1
        if sender.tag == currenAnswer {
            title = "Correct"
            score += 1
        }
        else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        if answerCounter == 10 {
            title = "\((10-score)/2) mistake"
            let ac = UIAlertController(title: title, message: "Your score is \(score). ", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "New Game",
                                       style: .default,
                                     handler: resetAll))
            present(ac, animated: true)
        }
        
        else{
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue",
                                   style: .default,
                                 handler: askQuestion))
        present(ac, animated: true)}
        
        
    }
    
}


