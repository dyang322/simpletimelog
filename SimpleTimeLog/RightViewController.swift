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
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var content1Label: UILabel!
    @IBOutlet weak var content2Label: UILabel!
    @IBOutlet weak var content3Label: UILabel!
    @IBOutlet weak var content4Label: UILabel!
    
    var calendarData:[String:[String]] = [:]
    
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
        var content1Str = ""
        var content2Str = ""
        var content3Str = ""
        var content4Str = ""

        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let dateSelected = formatter.string(from: date)
        
        if let detailsArr = calendarData[dateSelected]
        {

            content1Str = "\(detailsArr[0]) \(detailsArr[1])"
            content2Str = "\(detailsArr[2]) \(detailsArr[3])"
            content3Str = "\(detailsArr[4]) \(detailsArr[5]) \(detailsArr[6]) \(detailsArr[7])"
            content4Str = "\(detailsArr[8]) \(detailsArr[9]) \(detailsArr[10]) \(detailsArr[11])"
        }
        
        dateLabel.text = dateSelected
        content1Label.text = content1Str
        content2Label.text = content2Str
        content3Label.text = content3Str
        content4Label.text = content4Str

        
        
    }

    
    
    
    

}
