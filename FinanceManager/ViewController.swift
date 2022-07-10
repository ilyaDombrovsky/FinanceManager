//
//  ViewController.swift
//  FinanceManager
//
//  Created by Ilya Dombrovsky on 8.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    var stillTyping = false
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet var numbersFromKB: [UIButton]! {
        didSet {
            for button in numbersFromKB {
                button.layer.cornerRadius = 11
            }
        }
    }
    var categoryName = ""
    var displayValue = ""
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = String(sender.tag)
        
        if stillTyping {
            if displayLabel.text!.count < 15 {
                displayLabel.text! += number
            }
        } else {
            displayLabel.text = number
            stillTyping = true
        }
    }
    @IBAction func resetButton(_ sender: UIButton) {
        displayLabel.text = "0"
        stillTyping = false
    }
    
    
    @IBAction func categoryPressed(_ sender: UIButton) {
        categoryName = sender.titleLabel!.text!
        displayValue = displayLabel.text!
        displayLabel.text = "0"
        stillTyping = false
        
        print(categoryName)
        print(displayValue)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    return cell
}
}
 
