//
//  ViewController.swift
//  UITextView
//
//  Created by HigherVisibility on 19/02/2018.
//  Copyright © 2018 ahmedHigherVisibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var txt_addinfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.lbl.text = "Add Extra info"
        self.lbl.textAlignment = .center
        self.txt_addinfo.text = "Add Extra Info here"
        self.txt_addinfo.textColor = .lightGray
        self.txt_addinfo.delegate = self
        self.txt_addinfo.layer.borderWidth = 1
        self.txt_addinfo.layer.borderColor = UIColor.lightGray.cgColor
        self.txt_addinfo.layer.cornerRadius = 5
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        // self.txt_moreInfo.resignFirstResponder()
        if (txt_addinfo.text == "Add Extra Info here")
        {
            txt_addinfo.text = ""
            txt_addinfo.textColor = .black
        }
        txt_addinfo.becomeFirstResponder() //Optional
    }
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if (txt_addinfo.text == "")
        {
           txt_addinfo.text = "Add Extra Info here"
            txt_addinfo.textColor = .lightGray
        }
        txt_addinfo.resignFirstResponder()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text as NSString).rangeOfCharacter(from: CharacterSet.newlines).location == NSNotFound {
            return true
        }
       txt_addinfo.resignFirstResponder()
        return false
    }
    
}
