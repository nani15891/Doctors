//
//  LoginViewController.swift
//  Find a Doctor
//
//  Created by praveen dole on 3/21/19.
//  Copyright © 2019 Calibrage Info System Pvt Limitd. All rights reserved.
//

import UIKit

    class LoginViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
        
        var loginTitle = ["USER NAME","PASSWORD"]
        
        
        @IBOutlet weak var loginTableView: UITableView!
        
        @IBOutlet weak var imageLogoLogin: UIImageView!
        //  @IBOutlet weak var switchToAnOtheLocationOutLet: UIButton!
        
        @IBOutlet weak var forgotPWDBtn: UIButton!
        @IBOutlet weak var registrationBtn: UIButton!
        
        
        @IBOutlet weak var backgroundView: UIView!
        
        @IBOutlet weak var forgotBackGroundView: UIView!
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var userName            : String = ""
        var password            : String = ""
        var isRemeberMe         : Bool = false
        var isManualLogin       : Bool = false
        var isFirstTime = false
        
        //  var baseClientUrl = ""
        
        
        override func viewDidLoad() {
            super.viewDidLoad()

            print("Final Git")
            
            loginTableView.delegate = self
            loginTableView.dataSource = self
            
            backgroundView.isHidden = true
            forgotBackGroundView.isHidden = true
            
            imageLogoLogin.layer.borderWidth = 1
            imageLogoLogin.layer.masksToBounds = false
            imageLogoLogin.layer.borderColor = UIColor.black.cgColor
            imageLogoLogin.layer.cornerRadius = imageLogoLogin.frame.height/2
            imageLogoLogin.clipsToBounds = true
            
            
            // MARK:- RememberMe UIButton Check And UnCheck Condition
            if let rememberMe = UserDefaults.standard.value(forKey: "rememberMe"){
                if(rememberMe as? String == "true"){
                    userName = UserDefaults.standard.value(forKey: "SavedUserName") as! String
                    password = UserDefaults.standard.value(forKey: "SavedPassword") as! String
                    isRemeberMe = true
                }
            }
            
            registerTableViewCells()
            
            // Do any additional setup after loading the view.
        }
        
        
        
        
        // MARK:- RememberMe UIButton Check And UnCheck Condition
        private func registerTableViewCells() {
            
            loginTableView.register(UINib.init(nibName: "LoginCell", bundle: nil), forCellReuseIdentifier: "LoginCell")
            loginTableView.register(UINib.init(nibName: "SignInCell", bundle: nil), forCellReuseIdentifier: "SignInCell")
            loginTableView.register(UINib.init(nibName: "ForgetPasswordCell", bundle: nil),
                                    forCellReuseIdentifier: "ForgetPasswordCell")
        }
        
        override func viewWillAppear(_ animated: Bool) {
            
            super.viewWillAppear(animated)
            
            self.navigationController?.navigationBar.isHidden = true
            
            //    self.navigationController?.navigationBar.isHidden = true
            
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            
            super.viewWillDisappear(animated)
            
        }
        
        // MARK:- UITableviewDelegate AND UITableviewDataSource Methods
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return 3
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if (indexPath.row == 0) {
                
                let loginCell = tableView.dequeueReusableCell(withIdentifier: "LoginCell", for: indexPath) as! LoginCell
                loginCell.credentialTextField.delegate = self
                loginCell.credentialTextField.isSecureTextEntry = false
                loginCell.credentialTitle.text = loginTitle[indexPath.row]
                loginCell.credentialTextField.placeholder = "UserName"
                loginCell.credentialTextField.tag = 4444 + indexPath.row
                loginCell.credentialTextField.text = userName
                
                return loginCell
                
            } else if (indexPath.row == 1) {
                
                let loginCell = tableView.dequeueReusableCell(withIdentifier: "LoginCell", for: indexPath) as! LoginCell
                loginCell.credentialTextField.delegate = self
                loginCell.credentialTextField.isSecureTextEntry = true
                loginCell.credentialTitle.text = loginTitle[indexPath.row]
                loginCell.credentialTextField.placeholder = "Password"
                loginCell.credentialTextField.tag = 4444 + indexPath.row
                loginCell.credentialTextField.text = password
                
                
                return loginCell
                
            } else {
                
                let signInCell = tableView.dequeueReusableCell(withIdentifier: "SignInCell", for: indexPath) as! SignInCell
                signInCell.signInButton.addTarget(self,
                                                  action: #selector(LoginViewController.signInButtonTapped(_:)),
                                                  for: UIControl.Event.touchUpInside)
                
                return signInCell
            }
        }
        //MARK: - UITable View Delegate Methods
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return UITableView.automaticDimension
        }
        
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return UITableView.automaticDimension
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            loginTableView.deselectRow(at: indexPath, animated: true)
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            if let loginCell : LoginCell = textField.superview?.superview as? LoginCell {
                
                if textField.text != "" {
                    
                    if textField.tag == 4444 {
                        
                        userName = textField.text!
                        
                    } else {
                        
                        password = textField.text!
                    }
                    
                } else {
                    
                    if textField.tag == 4444 {
                        
                        userName = ""
                        
                    } else {
                        
                        password = ""
                    }
                }
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            textField.resignFirstResponder()
            return true
        }
        @IBAction func signInButtonTapped(_ sender: UIButton) {
            
            
           // loginTableView.endEditing(true)
            
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "tabBarcontroller") as! UITabBarController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = viewController
            
            
            
            
           
          //  loginTableView.reloadData()
        }
        

        @IBAction func forgotPassword(_ sender: Any) {
            
            backgroundView.alpha = 0.90
            backgroundView.isHidden = false
            forgotBackGroundView.isHidden = false
        }
        
        @IBAction func registration(_ sender: Any) {
            
            let RegistrationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
            self.navigationController?.pushViewController(RegistrationViewController, animated: true)
            
        }
        
        
        @IBAction func forgotSubmitBtn(_ sender: UIButton) {
            
            
            backgroundView.isHidden = true
            forgotBackGroundView.isHidden = true
            
            
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        
}
