//
//  ViewController.swift
//  TableView-AddFixDelete
//
//  Created by Trung on 6/28/18.
//  Copyright © 2018 TrungCatun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var outputTextFiled: UITextField!
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if data != nil{
            outputTextFiled.text = data
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        data = outputTextFiled.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

