//
//  ViewController.swift
//  TestQuestionsTableView
//
//  Created by super_user on 5/14/15.
//  Copyright (c) 2015 DevCom. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var constraitToMove: NSLayoutConstraint!
    @IBOutlet weak var viewToMove: UIView!
    
    private var heightToAdd: CGFloat!
    private var leaveToUp: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calcHeightToAdd()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.tableView {
            
            return 10
        } else {
            
            return 20
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if tableView == self.tableView {
            let cell = self.tableView.dequeueReusableCellWithIdentifier("ID1") as! UITableViewCell
            
            cell.textLabel?.text = "TableView1"
            cell.detailTextLabel?.text = "TableView1 detail"
            
            return cell
        } else {
            
            let cell = self.tableView2.dequeueReusableCellWithIdentifier("ID2") as! UITableViewCell
            
            cell.textLabel?.text = "TableView2"
            cell.detailTextLabel?.text = "TableView2 detail"
            
            return cell
        }
    }
    
    @IBAction func tapGesture(sender: AnyObject) {
        println("tapGesture")
        
        if leaveToUp == true {
            
            UIView.animateWithDuration(0.6, animations: { () -> Void in
                
                self.constraitToMove.constant += self.heightToAdd
                self.view.layoutIfNeeded()
            })
            
            leaveToUp = false
        } else {
            
            UIView.animateWithDuration(0.6, animations: { () -> Void in
                
                self.constraitToMove.constant -= self.heightToAdd
                self.view.layoutIfNeeded()
            })
            
            leaveToUp = true
        }
    }
    
    private func calcHeightToAdd() {
    
        let hView = self.view.frame.height
        let hStatusBar = UIApplication.sharedApplication().statusBarFrame.height
        let hNavBar = self.navigationController!.navigationBar.frame.height
        let hTabBar = self.tabBarController!.tabBar.frame.height
        let hViewToMove = self.viewToMove.frame.height
        heightToAdd = hView - hStatusBar - hNavBar - hTabBar - hViewToMove
    }
}

