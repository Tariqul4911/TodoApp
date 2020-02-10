//
//  ViewController.swift
//  AlamofireTest
//
//  Created by Md. Mehedi Hasan Akash on 1/16/20.
//  Copyright © 2020 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var showDataTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func getButtonTapped(_ sender: Any) {
        // Alamofire 4
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").response { response in // method defaults to `.get`
            debugPrint(response)
            
            self.showDataTextView.text = String(bytes: response.data!, encoding: .utf8)
        }
    }
    
}

