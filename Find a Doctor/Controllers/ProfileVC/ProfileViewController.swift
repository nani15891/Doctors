//
//  ProfileViewController.swift
//  Find a Doctor
//
//  Created by praveen dole on 3/22/19.
//  Copyright © 2019 Calibrage Info System Pvt Limitd. All rights reserved.
//

import UIKit
import TextFieldEffects
import IQKeyboardManagerSwift

class ProfileViewController : UIViewController, UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var profileTableView: UITableView!
    //MARK: -  variable declaration
    
    var appVersion          : String = ""
    var toolBar = UIToolbar()
    var activeTextField = UITextField()
    var alertTag = Int()
    var showNav = false
    var id:Int = 0
    var userId:String = ""
    var firstName:String = ""
    var middleName:String = ""
    var lastName:String = ""
    var contactNumber:String = "2457561545"
    var mobileNumber  : String = ""
    var userName     : String = ""
    var password       : String = ""
    var confirmpassword       : String = ""
    var roleId   : Int = 3
    var email:String = ""
    var isActive:Bool = true
    var createdByUserId:Int = 89
    var createdDate : String = "2018-01-31T10:43:28.8319786+05:30"
    var updatedByUserId : Int = 89
    var updatedDate:String =  "2018-01-31T10:43:28.8329795+05:30"
    var gender : String = ""
    var male = true
    var female = false
    var genderTypeID:Int = 27
    let datepicker = UIDatePicker()
    var dateofBirth:String = ""
    let dateFormatter = DateFormatter()
    var selectedDate : String = ""
    var DOB       : Int = 27
    var btneditClick = false
    var isEyeClicked = Bool()
    var sectionsTitle : [String] = [" "]
    var signUpTFPlaceholdersArray = ["Name","MobileNumber","E-mail","User Name","Password" ,"Confirm Password"]
    
    
    //MARK: -   View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        
        
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
        
        
        self.navigationItem.title = "Profile"
        // IQKeyboardManager.sharedManager().toolbarDoneBarButtonItemText = "Done"
        
        //    signeUpOutLet.setTitle("Submit" , for: .normal)
        //  allreadyhaveanAccount.text = "all ready have an Account?"
        //   signeUpOutLet.layer.borderWidth = 1.0
        //   signeUpOutLet.layer.cornerRadius = 6.0
        //   signeUpOutLet.layer.borderColor = UIColor(red: 122.0/255.0, green: 186.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor
        profileTableView.delegate = self
        profileTableView.dataSource = self
        activeTextField.delegate = self
        registerTableViewCells()
        
        //Registering Tableview Cell
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func registerTableViewCells() {
        
        let nibName1  = UINib(nibName: "SignUPTableViewCell" , bundle: nil)
        profileTableView.register(nibName1, forCellReuseIdentifier: "SignUPTableViewCell")
        
        let nibName3  = UINib(nibName: "GenderTableViewCell" , bundle: nil)
        profileTableView.register(nibName3, forCellReuseIdentifier: "GenderTableViewCell")
        
        //            let nibName1  = UINib(nibName: "RegisterCell" , bundle: nil)
        //            signUpTableView.register(nibName1, forCellReuseIdentifier: "RegisterCell")
        //
        
        
    }
    
    //MARK: -   View Will Appear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //     utillites.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Registration" , backTitle: " ", rightImage: "homeImg", secondRightImage: "Up", thirdRightImage: "Up")
    }
    
    
    //MARK: - Create date Picker Controller
    
    func CreatedatePicker(){
        
        datepicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //   let doneButton = UIBarButtonItem(title: "Done" , style: UIBarButtonItem.Style.bordered, target: self, action: #selector(donePressed))
        //   toolbar.setItems([doneButton], animated: false)
        activeTextField.inputAccessoryView = toolbar
        activeTextField.inputView = datepicker
    }
    
    
    //MARK: -  done Pressed
    
    func donePressed(){
        
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dateofBirth = dateFormatter.string(from: datepicker.date)
        selectedDate = dateFormatter.string(from: datepicker.date)
        activeTextField.text = selectedDate
        print(selectedDate)
        print(dateofBirth)
        self.view.endEditing(true)
        profileTableView.reloadData()
    }
    
    
    //MARK:- textField delegate methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        activeTextField = textField
        textField.autocorrectionType = .no
        
        if activeTextField.tag == 0 {
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .alphabet
        }
            
        else if activeTextField.tag == 1 {
            textField.maxLengthTextField = 10
            textField.keyboardType = .phonePad
        }
            
        else if activeTextField.tag == 2 {
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .emailAddress
        }
        else if activeTextField.tag == 3 {
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .emailAddress
        }
        else if activeTextField.tag == 4 {
            textField.maxLengthTextField = 25
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            textField.isSecureTextEntry = true
        }
        else if activeTextField.tag == 5{
            textField.maxLengthTextField = 25
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            textField.isSecureTextEntry = true
        }
        else if activeTextField.tag == 6{
            CreatedatePicker()
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if !string.canBeConverted(to: String.Encoding.ascii){
            return false
        }
        activeTextField = textField
        
        if activeTextField.tag == 0 {
            
            if string.characters.count > 0 {
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                let newLength = currentCharacterCount + string.characters.count - range.length
                let allowedCharacters = CharacterSet.letters
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                let space = CharacterSet.init(charactersIn: " ")
                let spacestr = string.trimmingCharacters(in: space)
                return newLength <= 50 && unwantedStr.characters.count == 0 ||  spacestr.characters.count == 0
            }
        }
        else if activeTextField.tag == 1 {
            
            if string.characters.count > 0 {
                let ACCEPTABLE_CHARACTERS = "0123456789"
                let cs = NSCharacterSet(charactersIn: ACCEPTABLE_CHARACTERS).inverted
                let filtered = string.components(separatedBy: cs).joined(separator: "")
                return (string == filtered)
            }
        }
        else if activeTextField.tag == 2 {
            
            if string.characters.count > 0 {
                let ACCEPTABLE_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
                let cs = NSCharacterSet(charactersIn: ACCEPTABLE_CHARACTERS).inverted
                let filtered = string.components(separatedBy: cs).joined(separator: "")
                return (string == filtered)
            }
        }
        else if activeTextField.tag == 3 {
            
            if string.characters.count > 0 {
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                let newLength = currentCharacterCount + string.characters.count - range.length
                
                let allowedCharacters = CharacterSet.decimalDigits
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return newLength <= 50 && unwantedStr.characters.count == 0
            }
        }
            
        else if activeTextField.tag == 4 || activeTextField.tag == 5{
            
            let indexPath = IndexPath.init(row: textField.tag, section: 0)
            
            if let forgotPasswordCell = profileTableView.cellForRow(at: indexPath) as? SignUPTableViewCell {
                forgotPasswordCell.eyeButtonOutlet.isHidden = false
                
                if let text = activeTextField.text,
                    let textRange = Range(range, in: text) {
                    let updatedText = text.replacingCharacters(in: textRange, with: string)
                    
                    if updatedText.count == 0 {
                        forgotPasswordCell.eyeButtonOutlet.isHidden = true
                    }
                }
            }
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if let newRegCell : SignUPTableViewCell = textField.superview?.superview as? SignUPTableViewCell {
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        activeTextField = textField
        
        if activeTextField.tag == 0{
            firstName = textField.text!
        }
        else if activeTextField.tag == 1{
            mobileNumber = textField.text!
        }
        else if activeTextField.tag == 2{
            email = textField.text!
        }
        else if activeTextField.tag == 3{
            userName = textField.text!
        }
        else if activeTextField.tag == 4 {
            password = textField.text!
        }
        else if activeTextField.tag == 5{
            confirmpassword = textField.text!
        }
    }
    
    
    //MARK: -   TableView Delegate & DataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 0 {
            
            return signUpTFPlaceholdersArray.count
        }else{
            
            return 1
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if indexPath.section == 0 {
            
            let signUPCell = tableView.dequeueReusableCell(withIdentifier: "SignUPTableViewCell", for: indexPath) as! SignUPTableViewCell
            signUPCell.registrationTextfield.delegate = self
            signUPCell.registrationTextfield.tag = indexPath.row
            signUPCell.eyeButtonOutlet.tag = indexPath.row
            
            if indexPath.row == 0{
                signUPCell.registrationTextfield.placeholder = "Name*"
                signUPCell.registrationTextfield.text = userName
                signUPCell.eyeButtonOutlet.isHidden = true
            }
                
            else if indexPath.row == 1{
                signUPCell.registrationTextfield.text = mobileNumber
                signUPCell.registrationTextfield.placeholder = "MobileNumber*"
                signUPCell.eyeButtonOutlet.isHidden = true
            }
                
            else if indexPath.row == 2{
                signUPCell.registrationTextfield.text = email
                signUPCell.registrationTextfield.placeholder = "E-mail*"
                signUPCell.eyeButtonOutlet.isHidden = true
            }
                
            else if indexPath.row == 3{
                signUPCell.registrationTextfield.text = mobileNumber
                signUPCell.registrationTextfield.placeholder = "User Name*"
                signUPCell.eyeButtonOutlet.isHidden = true
            }
                
                
            else if indexPath.row == 4{
                signUPCell.registrationTextfield.text = password
                signUPCell.registrationTextfield.placeholder = "Password*"
                signUPCell.eyeButtonOutlet.isHidden = false
                signUPCell.eyeButtonOutlet.addTarget(self, action: #selector(eyeButtonClicked(_:)), for: UIControl.Event.touchUpInside)
            }
                
            else if indexPath.row == 5{
                signUPCell.registrationTextfield.text = confirmpassword
                signUPCell.registrationTextfield.placeholder = "Confirm Password*"
                signUPCell.eyeButtonOutlet.isHidden = false
                signUPCell.eyeButtonOutlet.addTarget(self, action: #selector(eyeButtonClicked(_:)), for: UIControl.Event.touchUpInside)
            }
            
            signUPCell.eyeButtonOutlet.isHidden = true
            return signUPCell
            
        }else{
            let signUPCell = tableView.dequeueReusableCell(withIdentifier: "GenderTableViewCell", for: indexPath) as! GenderTableViewCell
            signUPCell.selectionStyle = .none
            signUPCell.femaleUnCheck.tintColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            signUPCell.maleUnCheckBtn.tintColor = #colorLiteral(red: 0.5568627451, green: 0.1254901961, blue: 0.1647058824, alpha: 1)
            //            if(btneditClick == true){
            //                signUPCell.maleUnCheckBtn.isUserInteractionEnabled = false
            //                signUPCell.femaleUnCheck.isUserInteractionEnabled = false
            //                signUPCell.maleBtn.isUserInteractionEnabled = true
            //                signUPCell.femaleBtn.isUserInteractionEnabled = true
            //            }
            //            else{
            //                signUPCell.femaleUnCheck.isUserInteractionEnabled = true
            //                signUPCell.maleUnCheckBtn.isUserInteractionEnabled = true
            //                signUPCell.femaleBtn.isUserInteractionEnabled = false
            //                signUPCell.maleBtn.isUserInteractionEnabled = false
            //            }
            if genderTypeID == 30 {
                signUPCell.femaleUnCheck.image = UIImage(named:"icons8-checked_filled-1")
                signUPCell.maleUnCheckBtn.image = UIImage(named:"icons8-unchecked_circle")
                male = false
                female = true
            }
            if genderTypeID == 27 {
                signUPCell.maleUnCheckBtn.image = UIImage(named:"icons8-checked_filled-1")
                signUPCell.femaleUnCheck.image = UIImage(named:"icons8-unchecked_circle")
                male = true
                female = false
            }
            if genderTypeID == 0 {
                signUPCell.maleUnCheckBtn.image = UIImage(named:"icons8-unchecked_circle")
                signUPCell.femaleUnCheck.image = UIImage(named:"icons8-unchecked_circle")
                male = false
                female = false
            }
            signUPCell.maleBtn.addTarget(self, action: #selector(self.maleBtnClicked), for: .touchUpInside)
            signUPCell.maleBtn.tag = 27
            signUPCell.femaleBtn.addTarget(self, action: #selector(self.femaleBtnClicked), for: .touchUpInside)
            signUPCell.femaleBtn.tag = 30
            return signUPCell
        }
        
    }
    
    //MARK: -   Eye Button Clicked
    
    
    @objc func  eyeButtonClicked(_ sendre:UIButton) {
        
        let indexPath = IndexPath.init(row: sendre.tag, section: 0)
        
        if let forgotPasswordCell = profileTableView.cellForRow(at: indexPath) as? SignUPTableViewCell {
            forgotPasswordCell.registrationTextfield.isSecureTextEntry = !forgotPasswordCell.registrationTextfield.isSecureTextEntry
            
            if isEyeClicked == true{
                forgotPasswordCell.eyeButtonOutlet.setImage(#imageLiteral(resourceName: "eyeclosed"), for: .normal)
                isEyeClicked = false
            }
                
            else{
                forgotPasswordCell.eyeButtonOutlet.setImage(#imageLiteral(resourceName: "eyeopen"), for: .normal)
                isEyeClicked = true
            }
        }
    }
    
    
    //MARK:- Male Btn Clicked
    
    @objc func maleBtnClicked(_ sender: UIButton) {
        
        let indexPath:IndexPath = IndexPath(row: 0, section: 1)
        
        if let cell : GenderTableViewCell = self.profileTableView.cellForRow(at: indexPath) as? GenderTableViewCell {
            
            if (male == true){
                cell.maleUnCheckBtn.image = UIImage(named:"icons8-checked_filled-1")
                cell.femaleUnCheck.image = UIImage(named:"icons8-unchecked_circle")
                male = false
            }
                
            else{
                cell.maleUnCheckBtn.image = UIImage(named:"icons8-unchecked_circle")
                cell.femaleUnCheck.image = UIImage(named:"icons8-checked_filled-1")
                male = true
            }
        }
        genderTypeID = 27
        print(genderTypeID)
        profileTableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    
    //MARK:- Female Btn Clicked
    
    
    @objc func femaleBtnClicked(_ sender: UIButton){
        
        let indexPath:IndexPath = IndexPath(row: 0, section: 1)
        
        if let cell : GenderTableViewCell = self.profileTableView.cellForRow(at: indexPath) as? GenderTableViewCell {
            
            if (male == true){
                cell.maleUnCheckBtn.image = UIImage(named:"icons8-unchecked_circle")
                cell.femaleUnCheck.image = UIImage(named:"icons8-checked_filled-1")
                male = false
            }
                
            else{
                cell.maleUnCheckBtn.image = UIImage(named:"icons8-checked_filled-1")
                cell.femaleUnCheck.image = UIImage(named:"icons8-unchecked_circle")
                male = true
            }
        }
        genderTypeID = 30
        print(genderTypeID)
        profileTableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    
    //MARK: -    Back Left Button Tapped
    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "1")
        //          UserDefaults.standard.removeObject(forKey: kLoginSucessStatus)
        UserDefaults.standard.set("1", forKey: "1")
        UserDefaults.standard.synchronize()
        self.navigationController?.popViewController(animated: true)
        print("Back Button Clicked......")
    }
    
    //MARK: -    Home Button Tapped
    
    
    @IBAction func homeButtonTapped(_ sender:UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "1")
        //  UserDefaults.standard.removeObject(forKey: kLoginSucessStatus)
        UserDefaults.standard.set("1", forKey: "1")
        UserDefaults.standard.synchronize()
        self.navigationController?.popViewController(animated: true)
        //   let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        //   appDelegate.window?.rootViewController = rootController
        print("Home Button Clicked......")
    }
    
    
    //MARK: -    submit Button Clicked
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        
    }
    
    //MARK:- validateAllFields
    
    
    
    
    
    
    
    
    // MARK :- login Clicked
    
    @IBAction func loginClicked(_ sender: Any) {
        
        let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        UserDefaults.standard.set("1", forKey: "1")
        UserDefaults.standard.synchronize()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    
    
    @IBAction func submitBtn(_ sender: Any) {
        
        
        
        
    }
}



