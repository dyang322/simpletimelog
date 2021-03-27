//
//  ViewController.swift
//  SimpleTimeLog
//
//  Created by David Yang on 3/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var addTimeButton: UIButton!
    @IBOutlet weak var timeElapsed: UILabel!
    @IBOutlet weak var time1Text: UITextView!
    
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var addTimeButton2: UIButton!
    @IBOutlet weak var timeElapsed2: UILabel!
    @IBOutlet weak var time2Text: UITextView!
    
    
    @IBOutlet weak var counter1: UILabel!
    @IBOutlet weak var counter1Plus: UIButton!
    @IBOutlet weak var counter1Minus: UIButton!
    
    @IBOutlet weak var counter2: UILabel!
    @IBOutlet weak var counter2Plus: UIButton!
    @IBOutlet weak var counter2Minus: UIButton!
    
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var save: UIButton!
    

    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    var timer2:Timer = Timer()
    var count2:Int = 0
    var timerCounting2:Bool = false
    
    var counter1Int:Int = 0
    var counter2Int:Int = 0
    
    var timer1Array:[String] = []
    var timer2Array:[String] = []
    var timer1ArrayCount:Int = 0
    var timer2ArrayCount:Int = 0
    var timer1ArrayString:String = ""
    var timer2ArrayString:String = ""
    var savedData:[String] = []
    var calendarData:[String:[String]] = [:]
    var timer1ArrayCountString:String = ""
    var timer2ArrayCountString:String = ""
    var counter1IntStr:String = ""
    var counter2IntStr:String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let rightVC = segue.destination as? RightViewController else {return}
        rightVC.calendarData = calendarData
    }
    
    @IBAction func counter1PlusTapped(_ sender: Any) {
        counter1Int = counter1Int + 1
        counter1.text = "\(counter1Int)"
    }
    
    @IBAction func counter1MinusTapped(_ sender: Any) {
        if(counter1Int > 0)
          {
            counter1Int = counter1Int - 1
            counter1.text = "\(counter1Int)"
           }
        else
        {
            counter1.text = "wet"
        }

    }
    
    @IBAction func counter2PlusTapped(_ sender: Any) {
        counter2Int = counter2Int + 1
        counter2.text = "\(counter2Int)"
    }
    
    @IBAction func counter2MinusTapped(_ sender: Any) {
        if(counter2Int > 0)
          {
            counter2Int = counter2Int - 1
            counter2.text = "\(counter2Int)"
           }
        else
        {
            counter2.text = "poop"
        }
    }
    
    
    
    @IBAction func addTimeTapped(_ sender: Any) {
        if(timerCounting)
        {
            addTimeButton.isSelected = false
            timerCounting = false
            timer.invalidate()
            count = 0
            timeElapsed.text = "00 : 00 : 00"
            time1.text = "00:00"
            
        }
        else{
            addTimeButton.isSelected = true
            timerCounting = true
            time1.text = stringFromDate()
            timerCounter()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            timer1Array.append(stringFromDate())
            timer1ArrayCount = timer1Array.count
            timer1ArrayString = timer1Array.joined(separator: ", ")
            time1Text.text = timer1ArrayString
        }
    }
    
    func stringFromDate() -> String
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func dateString() -> String
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let dateSelected = formatter.string(from: date)
        return dateSelected
    }
    
    @objc func timerCounter() -> Void
    {
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timeElapsed.text = timeString
        count = count + 1

    }

    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
    {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String
    {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    //2
    
    @IBAction func addTimeTapped2(_ sender: Any) {
        if(timerCounting2)
        {
            addTimeButton2.isSelected = false
            timerCounting2 = false
            timer2.invalidate()
            count2 = 0
            timeElapsed2.text = "00 : 00 : 00"
            time2.text = "00:00"
            
        }
        else{
            addTimeButton2.isSelected = true
            timerCounting2 = true
            time2.text = stringFromDate2()
            timerCounter2()
            timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter2), userInfo: nil, repeats: true)
            timer2Array.append(stringFromDate())
            timer2ArrayCount = timer2Array.count
            timer2ArrayString = timer2Array.joined(separator: ", ")
            time2Text.text = timer2ArrayString
        }
    }
    
    func stringFromDate2() -> String
    {
        let date2 = Date()
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "HH:mm"
        return formatter2.string(from: date2)
    }
    
    @objc func timerCounter2() -> Void
    {
        let time2 = secondsToHoursMinutesSeconds2(seconds: count2)
        let timeString2 = makeTimeString2(hours: time2.0, minutes: time2.1, seconds: time2.2)
        timeElapsed2.text = timeString2
        count2 = count2 + 1

    }

    func secondsToHoursMinutesSeconds2(seconds: Int) -> (Int, Int, Int)
    {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString2(hours: Int, minutes: Int, seconds: Int) -> String
    {
        var timeString2 = ""
        timeString2 += String(format: "%02d", hours)
        timeString2 += " : "
        timeString2 += String(format: "%02d", minutes)
        timeString2 += " : "
        timeString2 += String(format: "%02d", seconds)
        return timeString2
    }
    
    //reset and save
    
    @IBAction func resetTapped(_ sender: Any) {

        addTimeButton.isSelected = false
        timerCounting = false
        timer.invalidate()
        count = 0
        timeElapsed.text = "00 : 00 : 00"
        time1.text = "00:00"
        time1Text.text = ""
        
        addTimeButton2.isSelected = false
        timerCounting2 = false
        timer2.invalidate()
        count2 = 0
        timeElapsed2.text = "00 : 00 : 00"
        time2.text = "00:00"
        time2Text.text = ""
        
        counter1Int = 0
        counter1.text = "\(counter1Int)"
        
        counter2Int = 0
        counter2.text = "\(counter2Int)"
        
        timer1Array.removeAll()
        timer2Array.removeAll()
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        let todayDate = dateString()
        timer1ArrayCount = timer1Array.count
        timer1ArrayCountString = String(timer1ArrayCount)
        timer2ArrayCount = timer2Array.count
        timer2ArrayCountString = String(timer2ArrayCount)
        counter1IntStr = String(counter1Int)
        counter2IntStr = String(counter2Int)


        savedData = ["wet diaper", counter1IntStr, "poop diaper", counter2IntStr, "pump", timer1ArrayCountString, "times at", timer1ArrayString ,"feed", timer2ArrayCountString, "times at", timer2ArrayString]
        calendarData[todayDate] = savedData
        print(calendarData)     
    }
}



extension UIViewController
{
    @objc func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        switch swipe.direction.rawValue {
        case 1:
            performSegue(withIdentifier: "swipeRight", sender: self)
        case 2:
            performSegue(withIdentifier: "swipeLeft", sender: self)
        default:
            break
        }
    }
}
