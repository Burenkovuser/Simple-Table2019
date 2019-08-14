//
//  ViewController.swift
//  Simple Table
//
//  Created by Vasilii on 14/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let dwarves = [
        "Sleepy", "Snezzy", "Bashful", "Happy", "Doc", "Grumpy", "Dopey", "Thorin", "Dorin", "Nori", "Ori", "Balin", "Dwalin", "Fili", "Kili", "Oin", "Gloin", "Bifur", "Bofur", "Bombur"
    ]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
    
    // MARK: - Table View Delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if cell == nil {
            cell = UITableViewCell(
                style: .default, reuseIdentifier: simpleTableIdentifier)
        }
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highLightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highLightedImage// когда выделена будет менятся изображение
        cell?.textLabel?.text = dwarves[indexPath.row]
        
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Mr. Disney"
        } else {
            cell?.detailTextLabel?.text = "Mr. Tolkien"
        }
        
        //изменение шрифта и высоты строки
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        return cell!
    }
    
    // отступ для строки каждая дальше до 4 и цикл повторяетс
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    //метод определяет какая строка была выбрана
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    //если пользователь выбрал строку, можно что-то сделать, здесь алерт
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You slect \(rowValue)"
        
        let alert = UIAlertController(title: "Row selected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I did", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //метод позволяющий задать высоту строк
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120 : 70 //первая строк 120, остальные 70
    }
}

