//
//  RightViewController.swift
//  SimpleTimeLog
//
//  Created by David Yang on 3/17/21.
//

import UIKit
import FSCalendar

class RightViewController: UIViewController, FSCalendarDelegate {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var details: UILabel!
    var calendarData:[String:String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 16.0)
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 16.0)
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 16.0)
        
        calendar.appearance.todayColor = .systemRed
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.weekdayTextColor = .black
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(rightSwipe)
    }
  

    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let dateSelected = formatter.string(from: date)
        details.text = "\(dateSelected) \(String(calendarData[dateSelected]!))"
    }

    
    
    
    

}
