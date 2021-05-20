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

    override func viewDidLoad() {
        super.viewDidLoad()
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
        Analytics.trackEvent("crash_button_tapped",
                             withProperties: ["property key" : "property value"])
        Crashes.generateTestCrash()
    }
}

