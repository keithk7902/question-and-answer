

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        qNumber.text = String(questionNumber+1)
        question.text = testQuestions[questionNumber]
        generateAnswers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func Quit(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    var questionNumber:Int = 0
    var score:Int = 0
    
    var testQuestions = ["Bob’s father has 4 children. Momo, Meme, and Mumu are three of them. Who’s the fourth?","I have three apples. If you take away two from me, how many do you have?","You have a match and you enter a wagon with a candle, a lamp and a fireplace. Which one do you light first?","Which letter of the English alphabet flies, sings, and stings?","Complete the series. 9 = 4, 21 = 9, 22 = 9, 24 = 10, 8 = 5, 7 = 5, 99 = 10, 100 = 7, 16 = ?, 17 =?","How many numbers from 1 – 100 have the letter ‘A’ in their spellings?","Which one is correct? 'Penguins flies' or 'A Penguin flies'","How many sides does a circle have?","If there are 12 fish and half of them drown, how many are there?","If you had only one match, and entered a dark room containing an oil lamp, some newspaper, and some kindling wood, which would you light first?","If there are 6 apples and you take away 4, how many do you have?","How many legs does an elephant have if you count his trunk as a leg?","At a party, everybody shook hands with everybody else. There were 66 handshakes. How many people were at the party?","It's dark. You have ten grey socks and ten blue socks you want to put into pairs. All socks are exactly the same except for their colour. How many socks would you need to take with you to ensure you had at least a pair?","My grandson is about as many days as my daugher in weeks, and my grandson is as many months as I am in years. My grandson, my daughter and I together are 120 years. Can you tell me my age in years ?","A merchant can place 8 large boxes or 10 small boxes into a carton for shipping. In one shipment, he sent a total of 96 boxes. If there are more large boxes than small boxes, how many cartons did he ship?","Three friends Alice, Bond and Charlie divide $1105 amongs them in such a way that if $10, $20 and $15 are removed from the sums that Alice, Bond and Charlie received respectively, then the share of the sums that they got will be in the ratio of 11 : 18 : 24. How much did Charlie receive?","A, B and C, each working alone can complete a job in 6, 8 and 12 days respectively. If all three of them work together to complete a job and earn $ 2340, what will be C's share of the earnings?","If the price of gasoline increases by 25% and Ron intends to spend only 15% more on gasoline, by how much % should he reduce the quantity of gasoline that he buys?","The wages earned by Robin is 30% more than that earned by Erica. The wages earned by Charles is 60% more than that earned by Erica. How much % is the wages earned by Charles more than that earned by Robin?"]
    
    var answers = ["Bob","2","Match","B","16 = 7 and 17 = 9","None","Neither","2","12","The match","4","4","12","3","72","11","$495","$520","8%","23%"]
    
    var answerChoices = [
        ["Bob","Mom","Mark","Mumu"],
        ["2","1","3","0"],
        ["Match","Wagon","Candle","Fireplace"],
        ["B","C","D","Z"],
        ["16 = 7 and 17 = 9","16 = 8 and 17 = 10","16 = 6 and 17 = 9","16 = 7 and 17 = 8"],
        ["None","10","13","25"],
        ["Neither","Penguins flies","A Penguin flies","Both"],
        ["2","0","1","3"],
        ["12","6","0","2"],
        ["The match","The oil lamp","The newspaper","The kindling wood"],
        ["4","6","2","0"],
        ["4","5","6","7"],
        ["12","14","13","16"],
        ["3","16","8","7"],
        ["72","60","66","81"],
        ["11","40","26","55"],
        ["$495","$510","$480","$360"],
        ["$520","$630","$810","1100"],
        ["8%","10%","12%","15%"],
        ["23%","22%","21%","27%"]
    ]
    
    
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var Answer4: UIButton!
    
    
    func generateAnswers() -> () {
        var num1, num2, num3, num4: Int
        func randomNumber() -> Int {
            let randomNumber = Int(arc4random_uniform(4) + 1)
            return randomNumber
        }
        num1 = randomNumber()
        num2 = randomNumber()
        while num2 == num1 {
            num2 = randomNumber()
        }
        num3 = randomNumber()
        while (num3 == num1 || num3 == num2){
            num3 = randomNumber()
        }
        num4 = randomNumber()
        while(num4 == num1 || num4 == num2 || num4 == num3) {
            num4 = randomNumber()
        }
        var temp = answerChoices[questionNumber]
        Answer1.setTitle(temp[num1], for: [])
        Answer2.setTitle(temp[num2], for: [])
        Answer3.setTitle(temp[num3], for: [])
        Answer4.setTitle(temp[num4], for: [])
        
    }
    
    func nextQuestion() -> () {
        questionNumber += 1
        if questionNumber >= 10 {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        else {
            qNumber.text = String(questionNumber+1)
            question.text = testQuestions[questionNumber]
            generateAnswers()
            
        }
    }
    
    @IBOutlet weak var qNumber: UILabel!
    @IBOutlet weak var showScore: UILabel!
    @IBOutlet weak var question: UILabel!
    
    
    @IBAction func Answer1(_ sender: Any) {
        if Answer1.currentTitle == answers[questionNumber]  {
            score += 10
            self.Answer1.backgroundColor = UIColor.green
            Answer1.isUserInteractionEnabled = false
        }
        else {
            score -= 10
            self.Answer1.backgroundColor = UIColor.red
            Answer1.isUserInteractionEnabled = false
        }
        
    }
    
    
    
}





/*
 let controller =
 self.storyboard?.instantiateViewController(withIdentifier: "MovieController") as? movieViewController
 let but = sender as! UIButton
 controller?.name = but.currentTitle
 self.present(controller!, animated: true, completion: nil)
 */

//var testBank = [["Bob’s father has 4 children. Momo, Meme, and Mumu are three of them. Who’s the fourth?","Bob","Mom","Mark","Mumu"], ["I have three apples. If you take away two from me, how many do you have?","2","1","3","0"],["You have a match and you enter a wagon with a candle, a lamp and a fireplace. Which one do you light first?","Match","Wagon","Candle","Fireplace"],["Which letter of the English alphabet flies, sings, and stings?","B","C","D","Z"],["Complete the series. 9 = 4, 21 = 9, 22 = 9, 24 = 10, 8 = 5, 7 = 5, 99 = 10, 100 = 7, 16 = ?, 17 =?","16 = 7 and 17 = 9","16 = 8 and 17 = 10","16 = 6 and 17 = 9","16 = 7 and 17 = 8"],["How many numbers from 1 – 100 have the letter ‘A’ in their spellings?","None","10","13","25"],["Which one is correct? 'Penguins flies' or 'A Penguin flies'","Neither","Penguins flies","A Penguin flies","Both"],["How many sides does a circle have?","2","0","1","3"],["If there are 12 fish and half of them drown, how many are there?","12","6","0","2"],["If you had only one match, and entered a dark room containing an oil lamp, some newspaper, and some kindling wood, which would you light first?","The match","The oil lamp","The newspaper","The kindling wood"],["If there are 6 apples and you take away 4, how many do you have?","4","6","2","0"],["How many legs does an elephant have if you count his trunk as a leg?","4","5","6","7"],["At a party, everybody shook hands with everybody else. There were 66 handshakes. How many people were at the party?","12","14","13","16"],["It's dark. You have ten grey socks and ten blue socks you want to put into pairs. All socks are exactly the same except for their colour. How many socks would you need to take with you to ensure you had at least a pair?","3","16","8","7"],["My grandson is about as many days as my daugher in weeks, and my grandson is as many months as I am in years. My grandson, my daughter and I together are 120 years. Can you tell me my age in years ?","72","60","66","81"],["A merchant can place 8 large boxes or 10 small boxes into a carton for shipping. In one shipment, he sent a total of 96 boxes. If there are more large boxes than small boxes, how many cartons did he ship?","11","40","26","55"],["Three friends Alice, Bond and Charlie divide $1105 amongs them in such a way that if $10, $20 and $15 are removed from the sums that Alice, Bond and Charlie received respectively, then the share of the sums that they got will be in the ratio of 11 : 18 : 24. How much did Charlie receive?","$495","$510","$480","$360"],["A, B and C, each working alone can complete a job in 6, 8 and 12 days respectively. If all three of them work together to complete a job and earn $ 2340, what will be C's share of the earnings?","$520","$630","$810","1100"],["If the price of gasoline increases by 25% and Ron intends to spend only 15% more on gasoline, by how much % should he reduce the quantity of gasoline that he buys?","8%","10%","12%","15%"],["The wages earned by Robin is 30% more than that earned by Erica. The wages earned by Charles is 60% more than that earned by Erica. How much % is the wages earned by Charles more than that earned by Robin?","23%","22%","21%","27%"]]

/*var testQuestions = [
["Bob’s father has 4 children. Momo, Meme, and Mumu are three of them. Who’s the fourth?":"Bob"],
["I have three apples. If you take away two from me, how many do you have?":"2"],
["You have a match and you enter a wagon with a candle, a lamp and a fireplace. Which one do you light first?":"Match"],
["Which letter of the English alphabet flies, sings, and stings?":"B"],
["Complete the series. 9 = 4, 21 = 9, 22 = 9, 24 = 10, 8 = 5, 7 = 5, 99 = 10, 100 = 7, 16 = ?, 17 =?":"16 = 7 and 17 = 9"],
["How many numbers from 1 – 100 have the letter ‘A’ in their spellings?":"None"],
["Which one is correct? 'Penguins flies' or 'A Penguin flies'":"Neither"],
["How many sides does a circle have?":"2"],
["If there are 12 fish and half of them drown, how many are there?":"12"],
["If you had only one match, and entered a dark room containing an oil lamp, some newspaper, and some kindling wood, which would you light first?":"The match"],
["If there are 6 apples and you take away 4, how many do you have?":"4"],
["How many legs does an elephant have if you count his trunk as a leg?":"4"],
["At a party, everybody shook hands with everybody else. There were 66 handshakes. How many people were at the party?":"12"],
["It's dark. You have ten grey socks and ten blue socks you want to put into pairs. All socks are exactly the same except for their colour. How many socks would you need to take with you to ensure you had at least a pair?":"3"],
["My grandson is about as many days as my daugher in weeks, and my grandson is as many months as I am in years. My grandson, my daughter and I together are 120 years. Can you tell me my age in years ?":"72"],
["A merchant can place 8 large boxes or 10 small boxes into a carton for shipping. In one shipment, he sent a total of 96 boxes. If there are more large boxes than small boxes, how many cartons did he ship?":"11"],
["Three friends Alice, Bond and Charlie divide $1105 amongs them in such a way that if $10, $20 and $15 are removed from the sums that Alice, Bond and Charlie received respectively, then the share of the sums that they got will be in the ratio of 11 : 18 : 24. How much did Charlie receive?":"$495"],
["A, B and C, each working alone can complete a job in 6, 8 and 12 days respectively. If all three of them work together to complete a job and earn $ 2340, what will be C's share of the earnings?":"$520"],
["If the price of gasoline increases by 25% and Ron intends to spend only 15% more on gasoline, by how much % should he reduce the quantity of gasoline that he buys?":"8%"],
["The wages earned by Robin is 30% more than that earned by Erica. The wages earned by Charles is 60% more than that earned by Erica. How much % is the wages earned by Charles more than that earned by Robin?":"23%"]
]
 */

