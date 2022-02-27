//
//  DetailViewController.swift
//  My Diary
//
//  Created by zein rezky chandra on 27/02/22.
//

import UIKit

// MARK: - Protocol for our own delegate
protocol DetailViewControllerDelegate: AnyObject {
    // Delegate method that can be used
    func displayAlert()
}

class DetailViewController: UIViewController {

    // MARK: - Output element & Outlet connection
    
    @IBOutlet weak var storyLabel: UILabel!

    
    // MARK: - Object initialization & Optional
    
    // We need to prepare one object to catch what previous page has sent to here do displayed.
    var storyMessage: String?
    
    // MARK: - delegate object initialization
    weak var delegate: DetailViewControllerDelegate?
    
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        if let story = storyMessage {
            storyLabel.text = story
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Controls action
    
    @IBAction func doneAction(_ sender: UIButton) {
        // Now after user click ok, we want this page dismissed, and also we want to trigger and display an alert at the main page. How we able to achieve it? By using our own `delegate`
        self.dismiss(animated: true) {
            self.delegate?.displayAlert() // Whenever this code triggered, if main page has subscribed the delegate, it will trigger main page to do something with displayAlert method from here. So what we need to do, is to subscribe the `DetailViewControllerDelegate` and connect the delegate at main page.
        }
    }
    
}
