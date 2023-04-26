//
//  ViewController.swift
//  PipeCalculatorApp
//
//  Created by tosy on 9.04.23.
//

import UIKit
import Spring
final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.gosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
            // set the text from the data model
        cell.textLabel?.text = self.array.gosts[indexPath.row]
        if indexPath.row == 0{
            cell.backgroundColor = .orange
        }else{
            cell.backgroundColor = .orange
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You tapped cell number \(indexPath.row).")
        if indexPath.row == 0 {
            print("0")
        }else {
            print("1")
        }
    }
    

    let cellReuseIdentifier = "cell"
    let array = Array()
    let strings = Strings()
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var qustetionsBtn: UIButton!
    
    @IBOutlet var info: UIImageView!
    
    @IBOutlet var parameterView: SpringView!
    
    @IBOutlet var checkMarkD: UIImageView!
    
    @IBOutlet var checkMarkS: UIImageView!
    
    @IBOutlet var checkMarkL: UIImageView!
    
    @IBOutlet var checkMarkH: UIImageView!
    
    @IBOutlet var meterLabel: UILabel!
    
    @IBOutlet var znPipeLabel: UILabel!
    
    @IBOutlet var diameterTf: SpringTextField!
    
    @IBOutlet var thicknesTf: SpringTextField!
    
    @IBOutlet var lengthTf: SpringTextField!
    
    @IBOutlet var weightTf: SpringTextField!
    
    @IBOutlet var lengthLabel: UILabel!
    
    @IBOutlet var weightLabel: UILabel!
    
    @IBAction func question(_ sender: Any) {
        about()
    }
    
    @IBAction func diameterTextField(_ sender: Any) {
        diameter()
    }
    
    @IBAction func thicknesTextField(_ sender: Any) {
        thicknes()
    }
    
    @IBAction func lengthTextField(_ sender: Any) {
        lengths()
    }
    
    @IBAction func weightTextField(_ sender: Any) {
        weight()
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            parameterView.animation = Animations.shake.rawValue
            parameterView.force = 0.25
            parameterView.animate()
            segmentCaseOne()
        case 1:
            segmentCaseTwo()
            parameterView.animation = Animations.shake.rawValue
            parameterView.force = 0.25
            parameterView.animate()
        default: print("eror")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        // (optional) include this line if you want to remove the extra empty cell divider lines
         self.tableView.tableFooterView = UIView()
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func about() {
        if lengthLabel.text == strings.lengthTxt { alert() }
        else { alert1() }
    }
    
    private func viewSettings() {
        tableView.layer.cornerRadius = 17
        tableView.layer.shadowOffset = .init(width: 3, height: 3)
        
        overrideUserInterfaceStyle = .light
        parameterView.layer.cornerRadius = 17
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "about1")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        self.hideKeyboardWhenTappedAround()
        lengthLabel.text = strings.lengthTxt
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedMe))
        info.addGestureRecognizer(tap)
        info.isUserInteractionEnabled = true
    }
    
    @objc private func tappedMe() {
        alertImage()
    }
}
