//
//  ViewController.swift
//  AgingPeople
//
//  Created by Kaan Kabalak on 7/7/17.
//  Copyright © 2017 Kaan Kabalak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var people = ["Kaan", "Jerome", "Aaron",
                  "Erick", "Coco", "Kris",
                  "Wenmin", "Sarah", "Heather",
                  "Lucas", "Mike", "Jesse"]
    var ages: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 0..<people.count {
            ages.append(Int(arc4random_uniform(91))+5)
        }
        print(ages)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row]
        cell.detailTextLabel?.text = "\(ages[indexPath.row]) years old"
        return cell
    }
}
