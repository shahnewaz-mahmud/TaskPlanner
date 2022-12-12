//
//  TaskTViewCell.swift
//  Shahnewaz_30020-Task_Planner
//
//  Created by BJIT on 12/9/22.
//

import UIKit

class TaskTViewCell: UITableViewCell {
    
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var taskDuration: UILabel!
    @IBOutlet weak var taskPriority: UILabel!
    @IBOutlet weak var taskId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
