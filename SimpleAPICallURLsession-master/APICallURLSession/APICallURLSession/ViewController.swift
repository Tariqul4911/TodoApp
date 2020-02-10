//
//  ViewController.swift
//  APICallURLSession
//
//  Created by Md. Mehedi Hasan Akash on 1/13/20.
//  Copyright © 2020 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showData: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func getButtonTapped(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{return}
        
        let session = URLSession.shared
            session.dataTask(with: url) {(data, response, error) in if let response = response{
                print(response)
                }
                
                if let data = data{
                    self.showData.text = String(bytes: data, encoding: .utf8)
                    print(data)
                }
        }.resume()
    }
    
}

