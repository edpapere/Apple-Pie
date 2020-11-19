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
        "Тирасполь",
        // Азия:
        "Абу-Даби",
        "Амман",
        "Анкара",
        "Ашхабад",
        "Багдад",
        "Баку",
        "Бангкок",
        "Бандар-Сери-Бегаван",
        "Бейрут",
        "Бишкек",
        "Вьентьян",
        "Дакка",
        "Дамаск",
        "Дели (Нью-Дели)",
        "Джакарта",
        "Дили",
        "Доха",
        "Душанбе",
        "Ереван",
        "Иерусалим",
        "Исламабад",
        "Кабул",
        "Катманду",
        "Куала-Лумпур",
        "Мале",
        "Манама",
        "Манила",
        "Маскат",
        "Нейпьидо",
        "Никосия",
        "Нур-Султан",
        "Пекин",
        "Пномпень",
        "Пхеньян",
        "Сана",
        "Сеул",
        "Сингапур",
        "Ташкент",
        "Тбилиси",
        "Тегеран",
        "Токио",
        "Тхимпху",
        "Улан-Батор",
        "Ханой",
        "Шри-Джаяварденепура-Котте",
        "Эль-Кувейт",
        "Эр-Рияд",
        "Музаффарабад",
        "Никосия",
        "Рамалла",
        "Степанакерт",
        "Сухум",
        "Тайбэй",
        "Цхинвал",
        // Африка:
//        "Абуджа",
        "Аддис-Абеба",
//        "Аккра",
//        "Алжир",
        "Антананариву",
//        "Асмэра",
//        "Бамако",
//        "Банги",
//        "Банжул",
//        "Бисау",
//        "Браззавиль",
//        "Виктория",
//        "Виндхук",
//        "Габороне",
//        "Гитега",
        "Дакар",
//        "Джибути",
//        "Джуба",
//        "Додома",
        "Каир",
//        "Кампала",
//        "Кигали",
//        "Киншаса",
//        "Конакри",
//        "Либревиль",
//        "Лилонгве",
//        "Ломе",
//        "Луанда",
//        "Лусака",
//        "Малабо",
//        "Мапуту",
//        "Масеру",
//        "Мбабане",
//        "Могадишо",
//        "Монровия",
//        "Морони",
//        "Найроби",
//        "Нджамена",
//        "Ниамей",
//        "Нуакшот",
//        "Порт-Луи",
//        "Порто-Ново",
//        "Прая",
//        "Претория",
        "Рабат",
//        "Сан-Томе",
        "Триполи",
        "Тунис",
//        "Уагадугу",
//        "Фритаун",
//        "Хараре",
//        "Хартум",
//        "Ямусукро",
//        "Яунде",
//        "Харгейса",
//        "Тифарити",
        // Америка:
        "Асунсьон",
        "Бастер",
        "Бельмопан",
        "Богота",
        "Бразилиа",
        "Бриджтаун",
        "Буэнос-Айрес",
        "Вашингтон",
        "Гавана",
        "Гватемала",
        "Джорджтаун",
        "Каракас",
        "Кастри",
        "Кингстаун",
        "Кингстон",
        "Кито",
        "Лима",
        "Манагуа",
        "Мехико",
        "Монтевидео",
        "Нассау",
        "Оттава",
        "Панама",
        "Парамарибо",
        "Порт-о-Пренс",
        "Порт-оф-Спейн",
        "Розо",
        "Сан-Сальвадор",
        "Сан-Хосе",
        "Санто-Доминго",
        "Сантьяго",
        "Сент-Джонс",
        "Сент-Джорджес",
        "Сукре",
        "Тегусигальпа",
        // Австралия и Океания:
//        "Апиа",
        "Веллингтон",
        "Канберра"//,
//        "Маджуро",
//        "Нгерулмуд",
//        "Нукуалофа",
//        "Паликир",
//        "Порт-Вила",
//        "Порт-Морсби",
//        "Сува",
//        "Фунафути",
//        "Хониара",
//        "Южная Тарава (Баирики)",
//        "Ярен"
    ].shuffled()
    var totalLosses = 0 {
        didSet {
            newRun()
        }
    }
    var totalWins = 0 {
        didSet {
            newRun()
        }
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRun()
        updateUI()
        
    }
    
    fileprivate func enableButtons(_ enable: Bool = true) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func newRun() {
        guard !listOfWords.isEmpty else {
            updateUI()
            enableButtons(false)
            return
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        enableButtons()
    }
    
    fileprivate func updateCorrectWord() {
        var displayWord = [String]()
        for letter in currentGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: " ") //currentGame.guessedWord
    }
    
    func updateState() {
        if currentGame.incorrectMovesRemaining < 1 {
            totalLosses += 1
        } else if currentGame.guessedWord == currentGame.word {
            totalWins += 1
        }
        updateUI()
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
        updateState()
    }
    

}

