//
//  ViewController.swift
//  Evyree
//
//  Created by William Chen on 2022/10/23.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class SelectSchoolViewController: UIViewController, DatabaseListener, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var listenerType: ListenerType = .university
    
    var universities : [University] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    //Stores a reference to the database
    weak var dataBaseController: DatabaseProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        dataBaseController = appDelegate?.databaseController
        
        let database = Firestore.firestore()
        
        //Set the table view's delegate and data source
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    //This registers this class to receive updates from the database
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataBaseController?.addListener(listener: self)
    }
    
    //This unregisters this class to receive updates from the database
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dataBaseController?.removeListener(listener: self)
    }
    
    //MARK: TableView Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return universities.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath) as! UniversityTableViewCell
        
        let university = universities[indexPath.section]
        
        cell.schoolNameLabel.text = university.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let university = universities[indexPath.section]
        
        performSegue(withIdentifier: "selectSchoolToCreateAccountSegue", sender: university)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectSchoolToCreateAccountSegue" {
            let destination = segue.destination as! CreateAccountViewController
            //Provide it with the university we selected
            destination.university = sender as? University
        }
    }
    
    
    //MARK: Database listener functions
    func onAuthStateChange(user: User) {
        
    }
    
    func onAuthError(error: NSError) {
        
    }
    
    func onUniversitiesChange(change: DataBaseChange, universities: [University]) {
        //Update our universities
        self.universities = universities
        tableView.reloadData()
    }
    
    
    
    


}

