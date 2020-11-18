//
//  ViewController.swift
//  Apple Pie
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - Properties
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    var listOfWords = [
        "Амстердам",
        "Андорра-ла-Велья",
        "Афины",
        "Белград",
        "Берлин",
        "Берн",
        "Братислава",
        "Брюссель",
        "Будапешт",
        "Бухарест",
        "Вадуц",
        "Валлетта",
        "Варшава",
        "Ватикан",
        "Вена",
        "Вильнюс",
        "Дублин",
        "Загреб",
        "Киев",
        "Кишинёв",
        "Копенгаген",
        "Лиссабон",
        "Лондон",
        "Любляна",
        "Люксембург",
        "Мадрид",
        "Минск",
        "Монако",
        "Москва",
        "Осло",
        "Париж",
        "Подгорица",
        "Прага",
        "Рейкьявик",
        "Рига",
        "Рим",
        "Сан-Марино",
        "Сараево",
        "Скопье",
        "София",
        "Стокгольм",
        "Таллин",
        "Тирана",
        "Хельсинки",
        "Донецк",
        "Луганск",
        "Приштина",
        "Тирасполь"]
    var totalLosses = 0
    var totalWins = 0
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        
    }
    
    fileprivate func updateCorrectWord() {
        var displayWord = [String]()
        for letter in currentGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: " ") //currentGame.guessedWord
    }
    
    func updateUI() {
        let movesRemaining = currentGame.incorrectMovesRemaining
        let imageNumber = movesRemaining < 0 ? 0 : movesRemaining > 7 ? 7 : movesRemaining
        treeImageView.image = UIImage(named: "Tree \(imageNumber)")
        scoreLabel.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
        updateCorrectWord()
    }
    
    // MARK: - IB Actions
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateUI()
    }
    

}

