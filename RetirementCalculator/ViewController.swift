//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Derick, Derick | RASIA on 19/5/21.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {

    @IBOutlet weak var featureOneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Code for feature 3")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Analytics.trackEvent("show_main_view")
        
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Oops", message: "Has error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It's cool", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            Analytics.trackEvent("show_last_session_crash_alert")
        }
    }

    @IBAction func didTapCrashButton(_ sender: UIButton) {
        
        featureOneLabel.text = "hello"
        
//        Analytics.trackEvent("crash_button_tapped",
//                             withProperties: ["property key" : "property value"])
//        Crashes.generateTestCrash()
    }
}

