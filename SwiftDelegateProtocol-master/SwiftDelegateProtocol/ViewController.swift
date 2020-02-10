//
//  ViewController.swift
//  SwiftDelegateProtocol
//
//  Created by Md. Mehedi Hasan Akash on 2/3/20.
//  Copyright © 2020 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showDataTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func getTextButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "selectionScreen") as! SelectionScreen
        selectionVC.delegate = self
        print("In get text button func")
        present(selectionVC, animated: true, completion: nil)
    }
    
}

extension ViewController: DataSelectionDelegate {
    func didTapSelectButton(Text: String) {
        showDataTextView.text = Text
        print("In delegate ext Func")
    }
}

