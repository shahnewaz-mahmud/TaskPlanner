//
//  ViewController.swift
//  Shahnewaz_30020-Task_Planner
//
//  Created by BJIT on 12/9/22.
//

import UIKit

class ViewController: UIViewController, CatagoryCellDelegate {
    
    var catagory = catagoryList[0]
    var sectionTaskList: [Task] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let catagoryCellNib = UINib(nibName: Constants.catagoryCellId, bundle: nil)
        tableView.register(catagoryCellNib, forCellReuseIdentifier: Constants.catagoryCellId)
        
        let catagoryHeaderNib = UINib(nibName: Constants.catagorySectionHeaderViewId, bundle: nil)
        tableView.register(catagoryHeaderNib, forHeaderFooterViewReuseIdentifier: Constants.catagorySectionHeaderViewId)
        
        let taskHeaderNib = UINib(nibName: Constants.taskSectionHeaderViewId, bundle: nil)
        tableView.register(taskHeaderNib, forHeaderFooterViewReuseIdentifier: Constants.taskSectionHeaderViewId)
    
        //set the task list according to catagory to show in table cell
        setTaskList()
        
    }
    
    //for CatagoryCell Delegate
    func setTaskCatagory(type: String) {
        catagory = type
        print(catagory)
        setTaskList()
        tableView.reloadSections([1], with: .automatic)
    }

    //Reload the tasklist of particular catagory for table cell
    func setTaskList()
    {
        sectionTaskList.removeAll()
        for task in Task.taskList
        {
            if task.catagory == catagory && task.isDone == false
            {
                sectionTaskList.append(task)
            }
        }
    }

}


extension ViewController: UITableViewDataSource {
    
    //Set the number of rows for tableview cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 1
        }
        else
        {
            return sectionTaskList.count
        }
    }
    
    //set the reuseable cell for each section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0)
        {
            let catagoryCell = tableView.dequeueReusableCell(withIdentifier: Constants.catagoryCellId, for: indexPath) as! CatagoryCell
            catagoryCell.delegate = self
            return catagoryCell
        }
        else {
            
            let taskCell = tableView.dequeueReusableCell(withIdentifier: Constants.taskCellId, for: indexPath) as! TaskTViewCell
            
            taskCell.taskId.text = sectionTaskList[indexPath.row].taskId
            taskCell.taskTitle.text = sectionTaskList[indexPath.row].title
            taskCell.taskDuration.text = sectionTaskList[indexPath.row].duration
            taskCell.taskPriority.text = sectionTaskList[indexPath.row].priority
            
            return taskCell
        }
    }
    
    
    //Custom Header Footer
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if(section == 0)
        {
            let catagorySectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.catagorySectionHeaderViewId)
            return catagorySectionHeader
        }
        else
        {
            let taskSectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.taskSectionHeaderViewId) as! TaskSectionHeaderView
            taskSectionHeader.headerText.text = "You have \(sectionTaskList.count) tasks in \(catagory)"
            return taskSectionHeader
        }
        
    }
    
    //height for each header in tableview
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0)
        {
            return 60
        }
        else
        {
            return 150
        }
    }
}

//methods when selecting a cell in tableview

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Actions when trailing swipe action occurs. ex: Delete a task.
    //Here, UIContextualAction.haldler is a handler which is a closure
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteTaskAction = UIContextualAction(style: .destructive, title: nil) {
            [weak self] _,_,_ in
            
            guard let self = self else {return}
            
            let tableVCell = tableView.cellForRow(at: indexPath) as! TaskTViewCell
            
            self.handleTaskDeleteAction(indexPath: indexPath, taskId: tableVCell.taskId.text!)
            
        }
        
        deleteTaskAction.image = UIImage(systemName: "trash")
        deleteTaskAction.backgroundColor = .systemRed
        
        let swipeAction = UISwipeActionsConfiguration(actions: [deleteTaskAction])
        
        return swipeAction
    }
    
    //Actions when leading swipe action occurs. ex: Mark a task as done.
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let markAsDoneAction = UIContextualAction(style: .normal, title: nil) {
            [weak self] _,_,_ in
            
            guard let self = self else {return}
            
            let tableVCell = tableView.cellForRow(at: indexPath) as! TaskTViewCell
            self.handleMarkAsDoneAction(indexPath: indexPath, taskId: tableVCell.taskId.text!)
        }
        
        markAsDoneAction.image = UIImage(systemName: "checkmark.circle.fill")
        markAsDoneAction.backgroundColor = .systemCyan
        
        let swipeAction = UISwipeActionsConfiguration(actions: [markAsDoneAction])
        
        return swipeAction
        
        
    }

    //function for delete a task
    func handleTaskDeleteAction(indexPath: IndexPath, taskId: String)
    {
        let alertVC = UIAlertController(title: "Alert", message: "Are you sure?", preferredStyle: .alert)
        let confirmDelete = UIAlertAction(title: "Yes", style: .default){[weak self] _ in
            
            guard let self = self else { return }
            
            for i in 0...Task.taskList.count - 1
            {
                if Task.taskList[i].taskId == taskId{
                    Task.taskList.remove(at: i)
                    self.setTaskList()
                    self.tableView.reloadSections([1], with: .automatic)
                    break
                }
            }
        }
        
        alertVC.addAction(confirmDelete)
        present(alertVC, animated: true)
    }
    
    //function for mark a task as done
    func handleMarkAsDoneAction(indexPath: IndexPath, taskId: String)
    {
        for i in 0...Task.taskList.count - 1
        {
            if Task.taskList[i].taskId == taskId{
                Task.taskList[i].isDone = true
                setTaskList()
                tableView.reloadSections([1], with: .automatic)
                break
            }
        }
    }
}
  

