//
//  ViewController.swift
//  UITable View Sample & represent table
//
//  Created by masato on 8/10/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    // ---------------- Data Source ----------------------
    // make Table Data as NSArray
    private let myItems: NSArray = ["TEST1", "TEST2", "TEST3"]

    // Declace UITableView
    private var myTableView: UITableView!


    // ---------------- Table View Size ----------------
    override func viewDidLoad() {
        super.viewDidLoad()

        // get Height of Status Bar
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height

        // get View's Width
        let displayWidth: CGFloat = self.view.frame.width

        // get View's Height
        let displayHeight: CGFloat = self.view.frame.height

        // set TableView position
        // y: barHeight mean to make difference from Top.
        // height: displayHeight
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight))



    // ---------------- set CellReuseIdetifier ----------------
        // register Cell name as "MyCell"
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")


    // -----------set above Data set and Delegate -------------

        // set self to dataSource to DataSource.
        myTableView.dataSource = self

        // set self to Delegate
        myTableView.delegate = self

        // display tableVie on View
        self.view.addSubview(myTableView)

    }


    /*
     this Func Called, When Push the Item on TableView
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Number of Index Row: \(indexPath.row)")
        print("Value of Array: \(myItems[indexPath.row])")
    }

    /*
     Count Number of TableView Cells
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }

    /*
     set the value to TableView Cell
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // use the Cell again
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)

        // set the value to Cell
        cell.textLabel!.text = "\(myItems[indexPath.row])"

        return cell
    }

}
