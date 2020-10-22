//
//  ResultVC.swift
//  SeguePage
//
//  Created by Amit Gupta on 10/21/20.
//

import UIKit
import WebKit
import MessageKit
import InputBarAccessoryView
import SwiftyJSON
import Alamofire

class ResultViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var buttonChat: UIButton!
    var mood:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        print("In ResultVC.viewDidLoad()")
        topLabel.tintColor = .gray
        topLabel.layer.borderWidth=2
        topLabel.layer.cornerRadius=10
        //topLabel.layer.border Color = UIColor.blue.cgColor
        //topLabel.setTitleColor(UIColor.blue, for: .normal)
        topLabel.backgroundColor = UIColor.white
        topLabel.alpha = 0.9
        
        buttonChat.tintColor = .red
        buttonChat.layer.borderWidth=2
        buttonChat.layer.cornerRadius=10
        //buttonChat.layer.border Color = UIColor.blue.cgColor
        buttonChat.setTitleColor(UIColor.blue, for: .normal)
        buttonChat.backgroundColor = UIColor.white
        buttonChat.alpha = 0.9
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("In ResultVC.viewWillAppear()")
        topLabel.text = "Mood:" + (mood ?? "Unknown")
        var articleURL:String
        switch mood {
        case "sad":
            articleURL="https://www.nytimes.com/guides/well/how-to-be-happy"
        case "happy":
            articleURL="https://www.thesaurus.com/browse/fun"
        default:
            articleURL="https://www.thesaurus.com/browse/missing"
        }
        let url=URL(string:articleURL)
        let request = URLRequest(url: url!)
        webView.load(request)
        self.becomeFirstResponder()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("Someone pressed the button. Sending back.")
        performSegue(withIdentifier: "Result2Main", sender: self)
        
    }
}
