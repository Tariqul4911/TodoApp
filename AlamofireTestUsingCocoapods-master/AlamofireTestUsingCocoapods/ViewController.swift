//
//  ViewController.swift
//  AlamofireTestUsingCocoapods
//
//  Created by Md. Mehedi Hasan Akash on 1/16/20.
//  Copyright © 2020 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var showTextView: UITextView!
    @IBOutlet weak var showTextViewTime: UITextView!
    @IBOutlet weak var showTextViewAvg: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func getButtonTapped(_ sender: Any) {
        // Alamofire 4
        Alamofire.request("https://api.darksky.net/forecast/2a3099a6c73317d36830f4c9b80eba93/37.8267,-122.4233").response { response in // method defaults to `.get`
            debugPrint(response)
            
            /*do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
            } catch let parsingError {
                print("Error", parsingError)
            }*/
            
            //self.showTextView.text = String(bytes: response.data!, encoding: .utf8)
            //var dict1: [String:String] = [:]
            var dict1 = self.convertToDictionary(text: String(bytes: response.data!, encoding: .utf8)!)
            //let str = dict1!["currently"]! as! String
            let dict2 = dict1!["currently"] as? [String : Any]
            let summary = dict2!["summary"]
            let timestamp = dict2!["time"] //as? String
            let tempTime = timestamp as? Double
            let dateTime = self.getDateFromTimeStamp(timeStamp: tempTime!)
            let minutely = dict1!["minutely"] as? [String : Any]
            let data = minutely!["data"] as! NSArray
            let arrSize = data.count
            if(arrSize > 1){
                var iterator = ""
                var sumOfPrecipProbability = 0.0
                var precipProbabilityCounter = 0.0
                for iterator in data{
                    let dict3 = iterator as? [String : Any]
                    var precipProbability = dict3!["precipProbability"] as? Double
                    if precipProbability != 0{
                        sumOfPrecipProbability = sumOfPrecipProbability + precipProbability!
                        precipProbabilityCounter = precipProbabilityCounter + 1
                    }
                }
                print(sumOfPrecipProbability)
                print(precipProbabilityCounter)
                let averagePrecipProbability = (sumOfPrecipProbability/precipProbabilityCounter)
                print(averagePrecipProbability)
                self.showTextViewAvg.text = String(averagePrecipProbability)
            }
            //let dict2 = self.convertToDictionary(text: dict1!["currently"] as! String)
//            print("Dict1 starts here!")
//            print(dict1 as Any)
//            print("Dict1 ends here!")
//            print(dict1!["currently"])
//            print(dict2!["summary"] as Any)
//            print(dateTime)
//            print(timestamp)
//            print(tempTime)
//            print(type(of: dict2))
//            print(type(of: dict1))
//            print(type(of: timestamp))
//            print(type(of: tempTime))
//            print(minutely)
//            print("End of minutely")
//            print(data[0])
//            print(arrSize)
            self.showTextView.text = summary as? String
            self.showTextViewTime.text = dateTime as? String
            
        }
    }
    
    //jeson to dictionary
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    //timestramp to formated date
    func getDateFromTimeStamp(timeStamp : Double) -> String {
        
        let date = NSDate(timeIntervalSince1970: timeStamp)
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MMM d, yyyy h:mm:ss a"
        // UnComment below to get only time
        //  dayTimePeriodFormatter.dateFormat = "hh:mm a"
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
}

