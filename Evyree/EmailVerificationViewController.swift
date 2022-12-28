//
//  EmailVerificationViewController.swift
//  Evyree
//
//  Created by William Chen on 2022/12/14.
//

import UIKit

class EmailVerificationViewController: UIViewController, UITextFieldDelegate {
    
    
    //Outlets
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var thirdTextField: UITextField!
    
    @IBOutlet weak var fourthTextField: UITextField!
    
    @IBOutlet weak var fifthTextField: UITextField!
    
    @IBOutlet weak var resendButton: UIButton!
    
    @IBOutlet weak var verifyButton: UIButton!
    
    //UIViews
    @IBOutlet weak var firstTextFieldView: UIView!
    
    @IBOutlet weak var secondTextFieldView: UIView!
    
    @IBOutlet weak var thirdTextFieldView: UIView!
    
    @IBOutlet weak var fourthTextFieldView: UIView!
    
    @IBOutlet weak var fifthTextFieldView: UIView!
    
    //Verfication number
    var verificationNumber: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTextFields()
        verifyButton.layer.cornerRadius = 25
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Setup functions
    func setupTextFields(){
        firstTextField.text = ""
        secondTextField.text = ""
        thirdTextField.text = ""
        fourthTextField.text = ""
        fifthTextField.text = ""
        
        //Set the delegates
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self
        fifthTextField.delegate = self
        
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //print(textField.text)
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        
    }
    //MARK: Textfield actions
    @IBAction func textFieldEdited(_ sender: Any) {
        guard let textfield = sender as? UITextField else {
            fatalError("Failed to cast to UITextField")
        }
        
        
        print("New value: \(textfield.text)")
    }
    
    
    //MARK: Button Actions
    
    @IBAction func resendButtonAction(_ sender: Any) {
    }
    
    
    @IBAction func verifyButtonAction(_ sender: Any) {
    }
    
    
    

}
