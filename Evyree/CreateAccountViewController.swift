//
//  CreateAccountViewController.swift
//  Evyree
//
//  Created by William Chen on 2022/12/4.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

class CreateAccountViewController: UIViewController {
    
    
    @IBOutlet weak var fullNameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var fullNameWarningLabel: UILabel!
    @IBOutlet weak var emailWarningLabel: UILabel!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var usernameWarningLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    
    
    //Selected university
    var university: University?
    
    //Stores a reference to the database
    weak var dataBaseController: DatabaseProtocol?
    
    //Get our firestore reference
    var fireStore: Firestore = Firestore.firestore()
    
    //Verification number
    var verificationNumber: Int = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        //Hide the warning labels
        fullNameWarningLabel.isHidden = true
        emailWarningLabel.isHidden = true
        usernameWarningLabel.isHidden = true
        
        //Get our database controller reference
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        dataBaseController = appDelegate?.databaseController
        
        //Setup button
        createAccountButton.layer.cornerRadius = 25
        
        
        
    }
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        //Make sure all fields are entered
        guard let fullNametext = fullNameTextfield.text, let emailText = emailTextfield.text, let userNameText = usernameTextfield.text else {
            fatalError("Failed to unwrap text values")
        }
        
        //Hide all warning labels
        fullNameWarningLabel.isHidden = true
        emailWarningLabel.isHidden = true
        usernameWarningLabel.isHidden = true
        
        //Check which ones to unhide
        if fullNametext.isEmpty{
            fullNameWarningLabel.isHidden = false
        }
        if emailText.isEmpty{
            emailWarningLabel.isHidden = false
        }
        if userNameText.isEmpty{
            usernameWarningLabel.isHidden = false
        }
        
        //If either is missing, just return without handling create account
        if fullNametext.isEmpty || emailText.isEmpty || userNameText.isEmpty {
            //If email is invalid also display the warning text
            if !emailText.lowercased().hasSuffix(university!.emailDomain!.lowercased()){
                emailWarningLabel.isHidden = false
            }
            return
        }
        
        //Check if email ends with the correct domain
        if emailText.hasSuffix(university!.emailDomain!){
            sendVerificationCode(email: emailText, name: fullNametext)
            
            //Perform segue
            performSegue(withIdentifier: "createAccountVerificationSegue", sender: nil)
        } else {
            //Incorrect email, unhide the email warning label and return
            emailWarningLabel.isHidden = false
            return
        }
        
    }
    
    ///This function sends an email with the verification code to the user
    func sendVerificationCode(email: String, name: String){
        
        //Generate our six digit verification code
        let signinCode = Int.random(in: 100000...999999)
        //Set our verification number
        self.verificationNumber = signinCode
        
        fireStore.collection("mail").addDocument(data: [
            "to": email,
            "message": [
              "subject": "Evyree Verification Code",
              "html": "Your Evyree verification code is: \(signinCode)"
            ]
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createAccountVerificationSegue"{
            //Set our verification number
            let destination = segue.destination as? EmailVerificationViewController
            destination?.verificationNumber = self.verificationNumber
            
        }
    }

}
