//
//  TableViewController.swift
//  TableView-AddFixDelete
//
//  Created by Trung on 6/28/18.
//  Copyright © 2018 TrungCatun. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var number = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBOutlet weak var footerView: UIView!
    @IBOutlet var noData: UIView!
    
    var hasNoDaTa: Bool = true {
        didSet {
            hasNoDaTa ? (tableView.tableFooterView = noData) : (tableView.tableFooterView = footerView) // kiem tra neu nodata = true vao () dau, neu nodata = fales vao () thu 2
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hasNoDaTa = number.count == 0 // kiem tra neu number.count == 0 thi hasnodata = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return number.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = String(number[indexPath.row])
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as? DetailViewController
        if let index = tableView.indexPathForSelectedRow{
            detailViewController?.data = String(number[index.row])
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let detailViewController = unwindSegue.source as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow {
                number[index.row] = Int(detailViewController.data ?? "") ?? 0
            }
            else {
                number.append(Int(detailViewController.data ?? "") ?? 0)
            }
            tableView.reloadData()
        }
        
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            number.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            hasNoDaTa = number.count == 0

        }
    }

}
