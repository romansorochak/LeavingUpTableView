//
//  ViewController2.swift
//  TestQuestionsTableView
//
//  Created by super_user on 5/14/15.
//  Copyright (c) 2015 DevCom. All rights reserved.
//

import UIKit

class ViewController2 : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewToMove: UIView!
    @IBOutlet weak var constraintToMove: NSLayoutConstraint!
    
    private var heightToAdd: CGFloat!
    private var upToMove: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calcHeightToAdd()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ID") as! UITableViewCell
        
        cell.textLabel?.text = "Table View"
        
        return cell
    }
    
    /*
    * MARK - swiping
    */
    
    @IBAction func swipeUp(sender: UISwipeGestureRecognizer) {
        println("swipeUp")
        
        if upToMove == true {
        
            UIView.animateWithDuration(0.6, animations: { () -> Void in
            
                self.constraintToMove.constant += self.heightToAdd
                self.view.layoutIfNeeded()
            })
            
            self.tableView.scrollEnabled = !self.tableView.scrollEnabled
            self.upToMove = false
        }
    }
    
    @IBAction func swipeDown(sender: UISwipeGestureRecognizer) {
        println("swipeDown")
        
        if upToMove == false {
            
            UIView.animateWithDuration(0.6, animations: { () -> Void in
                
                self.constraintToMove.constant -= self.heightToAdd
                self.view.layoutIfNeeded()
            })
            
            self.tableView.scrollEnabled = !self.tableView.scrollEnabled
            self.upToMove = true
        }
    }
    
    private func calcHeightToAdd() {
        
        let hView = self.view.frame.height
        let hStatusBar = UIApplication.sharedApplication().statusBarFrame.height
        let hNavBar = self.navigationController!.navigationBar.frame.height
        let hViewToMove = self.viewToMove.frame.height
        heightToAdd = hView / 2 - hStatusBar - hNavBar - hViewToMove / 2
    }
}
