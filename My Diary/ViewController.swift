//
//  ViewController.swift
//  My Diary
//
//  Created by zein rezky chandra on 23/02/22.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    // MARK: - Input element & outlet connection
    
    /* Here we learn how we use UI Input element such as UITextView, and how we need the IBOutlet connection to manage (update the value) of the UI element it self. */
    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.drawARoundedCorner()
            cancelButton.drawABorder()
        }
    }
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.drawARoundedCorner()
        }
    }
    
    /* Here we learn how we use UI element as controls such as UIButton */
    //@IBOutlet weak var saveButton: UIButton!
    
    var story = ""
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Let's define our text area with something that can help user knowing where he should interact with the input element
        textArea.text = "Input your story here..."
        
        textArea.delegate = self
    }

    // MARK: - Controls
    
    /* Here we know that every UI element that act as controls has an action that can be define directly without Outlet connection needed */
    @IBAction func saveAction(_ sender: UIButton) {
        // Now let's do some small validation, we won't let user able to save it unless user has input something onto the textview element.
        
        // Let's create an Alert once, but able to provoke different value of message
        if textArea.text.isEmpty || textArea.text == "" || textArea.text == "Input your story here..." {
            displayAlert(title: "Warning!", body: "Please input something first before it saved!", isDisplayDetail: false)
        } else {
            displayAlert(title: "Yeayyy!", body: "Diary has been saved!", isDisplayDetail: true)
        }
    }
    
    // MARK: - Function
    
    func displayAlert(title: String, body: String, isDisplayDetail: Bool) {
        let alert = UIAlertController.init(title: title, message: body, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.default) { action in
            alert.dismiss(animated: true) {
                if isDisplayDetail {

                }
            }
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    /* Now we want to know, if user has start to input something to our UITextView element, so we can do something with it. But first, let's learn about `delegate`. UITextView has built in method that we can use to detect if it's start editing or end editing. But in order to use that method, we need to have the `delegate` from it's UITextView. */
    
    // MARK: - Delegate method from UITextViewDelegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        // Let's clear up our text area, so then user can start to write their story
        textView.text = ""
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            // Since our textview text it's an optional, which possible to have a nil, then we need to use it savely
            if let storyHasSomething = textView.text {
                story = storyHasSomething
            }
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}

