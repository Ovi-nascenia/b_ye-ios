//
//  ViewController.swift
//  Biyeta-Ios
//
//  Created by NACENIA on 5/3/17.
//  Copyright © 2017 NACENIA. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var _user_name: UITextField!
    @IBOutlet weak var _userpassword: UITextField!
    
    let parameters: Parameters = ["user_login[email] ": "test.biyeta.com"]
    
    var activityInductor: UIActivityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInOperation(_ sender: Any) {
        
       
//        activityInductor.startAnimating()
        
        activityInductor.center = self.view.center
        activityInductor.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityInductor)
        
        let user: String = _user_name.text!
        
        let userpassword = _userpassword.text
        
        if user == nil || user == "" || userpassword == nil || userpassword == ""
        {
            let alert = UIAlertController(title: "Error", message: "Enter User Name and Password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        else
        {
            print("call network operation")
          
            activityInductor.startAnimating()
            login {
                activityInductor.stopAnimating()
                
                performSegue(withIdentifier: "main_ui_segue", sender: self)
            }
        }
        
    }
    
    
    func login (completed : downloadComplete)
    {
        let parameters : [ String : String] = [
            "user_login[email]":"test7@biyeta.com",
            "user_login[password]":"password"
        ]
        
        Alamofire.request(baseURL+signUpSubURL, method: .post, parameters: parameters).responseJSON { response in
           
                    print("\(response.result.value)")
            
        }
        
        
        completed()
    }

}

