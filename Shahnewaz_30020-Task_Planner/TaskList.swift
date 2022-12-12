//
//  TaskList.swift
//  Shahnewaz_30020-Task_Planner
//
//  Created by BJIT on 12/9/22.
//

import Foundation

struct Task {
    let taskId: String
    let title: String
    let catagory: String
    let duration: String
    let priority: String
    var isDone: Bool
}

public var catagoryList = ["UI/UX Design", "Frontend Dev", "Backend Dev", "Product Design", "DevOps" ]

extension Task
{
    static var taskList =
    [Task(taskId: "T001", title: "Fix UI 1", catagory: "UI/UX Design", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T002", title: "Fix UI 2", catagory: "UI/UX Design", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T003", title: "Fix UI 3", catagory: "UI/UX Design", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T004", title: "Fix UI 4", catagory: "UI/UX Design", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T005", title: "Fix UI 5", catagory: "UI/UX Design", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T006", title: "Fix Frontend 1", catagory: "Frontend Dev", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T007", title: "Fix Frontend 2", catagory: "Frontend Dev", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T008", title: "Fix Frontend 3", catagory: "Frontend Dev", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T009", title: "Fix Frontend 4", catagory: "Frontend Dev", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T010", title: "Fix Frontend 5", catagory: "Frontend Dev", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T011", title: "Fix Backend 1", catagory: "Backend Dev", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T012", title: "Fix Backend 2", catagory: "Backend Dev", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T013", title: "Fix Backend 3", catagory: "Backend Dev", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T014", title: "Fix Backend 4", catagory: "Backend Dev", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T015", title: "Fix Backend 5", catagory: "Backend Dev", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T016", title: "Design Label 1", catagory: "Product Design", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T017", title: "Design Label 2", catagory: "Product Design", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T018", title: "Design Label 3", catagory: "Product Design", duration: "2 Hours", priority: "High", isDone: false),
     Task(taskId: "T017", title: "Deploy sever 1", catagory: "DevOps", duration: "2 Hours", priority: "High", isDone: false)]
    
}
