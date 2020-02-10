//
//  ViewController.swift
//  SwiftDelegateProtocol
//
//  Created by Md. Mehedi Hasan Akash on 2/3/20.
//  Copyright © 2020 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit

let notificationKey = "com.testapp.notify"

class ViewController: UIViewController {
    
    let notify = Notification.Name(rawValue: notificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBOutlet weak var showDataTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateTextField(notification:)), name: notify, object: nil)
    }
    
    @objc func updateTextField(notification: NSNotification){
        let isNotify = notification.name == notify
        isNotify ? print("Notification received") : print("Error!")
        showDataTextView.text = notification.object as! String
        
    }
    
    @IBAction func getTextButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "selectionScreen") as! SelectionScreen
        
        // for delegate
        //selectionVC.delegate = self
        
        
        
        print("In get text button func")
        present(selectionVC, animated: true, completion: nil)
    }
    
}

// for delegate
//extension ViewController: DataSelectionDelegate {
//    func didTapSelectButton(Text: String) {
//        showDataTextView.text = Text
//        print("In delegate ext Func")
//    }
//}

