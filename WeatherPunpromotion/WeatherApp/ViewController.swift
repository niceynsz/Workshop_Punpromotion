//
//  ViewController.swift
//  WeatherApp
//
//  Created by Nice on 5/5/2567 BE.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var dailyTemperatureData: [(min: Double, max: Double, date: String)] = []
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var tempLabel1: UILabel!
    @IBOutlet weak var tempLabel2: UILabel!
    @IBOutlet weak var tempLabel3: UILabel!
    @IBOutlet weak var tempLabel4: UILabel!
    @IBOutlet weak var tempLabel5: UILabel!
    @IBOutlet weak var tempLabel6: UILabel!
    @IBOutlet weak var tempLabel7: UILabel!
    
    @IBOutlet weak var dateLabel1: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    @IBOutlet weak var dateLabel3: UILabel!
    @IBOutlet weak var dateLabel4: UILabel!
    @IBOutlet weak var dateLabel5: UILabel!
    @IBOutlet weak var dateLabel6: UILabel!
    @IBOutlet weak var dateLabel7: UILabel!
    
    @IBAction func currentButton(_ sender: Any) {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "VC2") as! SecondViewController
        navigationController?.pushViewController(vc2, animated: true)
        //present(vc2, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherDatafirst()
    }
    
    func WeatherDatafirst() {
        // สร้าง URL
        let url = "https://api.open-meteo.com/v1/forecast?latitude=15.875&longitude=101.0&hourly=temperature_2m"
        
        // ทำการเรียก API ด้วย Alamofire
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                // ดึงข้อมูล JSON ออกมาแสดง
                if let json = value as? [String: Any],
                   let hourlyData = json["hourly"] as? [String: Any],
                   let temperatureArray = hourlyData["temperature_2m"] as? [Double] {
                    
                    // ดึงข้อมูลอุณหภูมิในช่วงเวลาตั้งแต่ 0 ถึง 23 นาฬิกา ของวันที่ 5 พฤษภาคม 2024
                    let temperaturesFirstDay = Array(temperatureArray[0..<23])
                    
                    // หาค่า min และ max
                    let minTemperature = temperaturesFirstDay.min() ?? 0
                    let maxTemperature = temperaturesFirstDay.max() ?? 0
                    
                    let minTempValue = Int(minTemperature)
                    let maxTempValue = Int(maxTemperature)
                    // แสดงผลทั้งคู่ผ่าน tempLabel1
                    DispatchQueue.main.async {
                        self.currentTempLabel.text = "\(minTempValue)°/\(maxTempValue)°"
                    }
                }
            case .failure(let error):
                // แสดง Error กรณีเกิดข้อผิดพลาด
                print("Error: \(error)")
            }
        }
        WeatherData1()
    }
    
    func WeatherData1() {
        // สร้าง URL
        let url = "https://api.open-meteo.com/v1/forecast?latitude=15.875&longitude=101.0&hourly=temperature_2m"
        
        // ทำการเรียก API ด้วย Alamofire
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                // ดึงข้อมูล JSON ออกมาแสดง
                if let json = value as? [String: Any],
                   let hourlyData = json["hourly"] as? [String: Any],
                   let timeArray = hourlyData["time"] as? [String],
                   let temperatureArray = hourlyData["temperature_2m"] as? [Double] {
                    
                    // ดึงข้อมูลอุณหภูมิในช่วงเวลาตั้งแต่ 0 ถึง 23 นาฬิกา ของวันที่ 5 พฤษภาคม 2024
                    let temperatures1 = Array(temperatureArray[0..<23])
                    
                    // หาค่า min และ max
                    let minTemperature = temperatures1.min() ?? 0
                    let maxTemperature = temperatures1.max() ?? 0
                    
                    let minTempValue = Int(minTemperature)
                    let maxTempValue = Int(maxTemperature)
                    
                    // แปลงวันที่
                    let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm" // รูปแบบเวลาจาก JSON
                    let date = dateFormatter.date(from: timeArray[20]) // วันที่ในช่วงเวลาที่ต้องการ
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // กำหนด locale
                        dateFormatter.dateFormat = "d/M    EEEE" // รูปแบบที่ต้องการแสดง
                    let dateString = dateFormatter.string(from: date!) // แปลงวันที่เป็นสตริง
                    // แสดงผลทั้งคู่ผ่าน tempLabel1
                    DispatchQueue.main.async {
                                       self.tempLabel1.text = "\(minTempValue)°/\(maxTempValue)°"
                                       self.dateLabel1.text = dateString
                                   }
                }
            case .failure(let error):
                // แสดง Error กรณีเกิดข้อผิดพลาด
                print("Error: \(error)")
            }
        }
        WeatherData2()
    }
    
    func WeatherData2() {
        // สร้าง URL
        let url = "https://api.open-meteo.com/v1/forecast?latitude=15.875&longitude=101.0&hourly=temperature_2m"
        
        // ทำการเรียก API ด้วย Alamofire
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                // ดึงข้อมูล JSON ออกมาแสดง
                if let json = value as? [String: Any],
                   let hourlyData = json["hourly"] as? [String: Any],
                   let timeArray = hourlyData["time"] as? [String],
                   let temperatureArray = hourlyData["temperature_2m"] as? [Double] {
                    
                    // ดึงข้อมูลอุณหภูมิในช่วงเวลาตั้งแต่ 0 ถึง 23 นาฬิกา
                    let temperatures2 = Array(temperatureArray[24...47])
                    
                    // หาค่า min และ max
                    let minTemperature = temperatures2.min() ?? 0
                    let maxTemperature = temperatures2.max() ?? 0
                    
                    let minTempValue = Int(minTemperature)
                    let maxTempValue = Int(maxTemperature)
                    
                    // แปลงวันที่
                    let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm" // รูปแบบเวลาจาก JSON
                    let date = dateFormatter.date(from: timeArray[44]) // วันที่ในช่วงเวลาที่ต้องการ
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // กำหนด locale
                        dateFormatter.dateFormat = "d/M    EEEE" // รูปแบบที่ต้องการแสดง
                    let dateString = dateFormatter.string(from: date!) // แปลงวันที่เป็นสตริง
                   
                    // แสดงผลทั้งคู่ผ่าน tempLabel2
                    DispatchQueue.main.async {
                        self.tempLabel2.text = "\(minTempValue)°/\(maxTempValue)°"
                        self.dateLabel2.text = dateString
                    
                    }
                }
            case .failure(let error):
                // แสดง Error กรณีเกิดข้อผิดพลาด
                print("Error: \(error)")
            }
        }
        WeatherData3()
    }
    
    func WeatherData3() {
        // สร้าง URL
        let url = "https://api.open-meteo.com/v1/forecast?latitude=15.875&longitude=101.0&hourly=temperature_2m"
        
        // ทำการเรียก API ด้วย Alamofire
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                // ดึงข้อมูล JSON ออกมาแสดง
                if let json = value as? [String: Any],
                   let hourlyData = json["hourly"] as? [String: Any],
                   let timeArray = hourlyData["time"] as? [String],
                   let temperatureArray = hourlyData["temperature_2m"] as? [Double] {
                    
                    // ดึงข้อมูลอุณหภูมิในช่วงเวลาตั้งแต่ 0 ถึง 23 นาฬิกา
                    let temperatures3 = Array(temperatureArray[48..<71])
                    
                    // หาค่า min และ max
                    let minTemperature = temperatures3.min() ?? 0
                    let maxTemperature = temperatures3.max() ?? 0
                    
                    let minTempValue = Int(minTemperature)
                    let maxTempValue = Int(maxTemperature)
                    
                    // แปลงวันที่
                    let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm" // รูปแบบเวลาจาก JSON
                    let date = dateFormatter.date(from: timeArray[69]) // วันที่ในช่วงเวลาที่ต้องการ
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // กำหนด locale
                        dateFormatter.dateFormat = "d/M    EEEE" // รูปแบบที่ต้องการแสดง
                    let dateString = dateFormatter.string(from: date!) // แปลงวันที่เป็นสตริง
                   
                    // แสดงผลทั้งคู่ผ่าน tempLabel3
                    DispatchQueue.main.async {
                        self.tempLabel3.text = "\(minTempValue)°/\(maxTempValue)°"
                        self.dateLabel3.text = dateString
                    }
                }
            case .failure(let error):
                // แสดง Error กรณีเกิดข้อผิดพลาด
                print("Error: \(error)")
            }
        }
        WeatherData4()
    }
    
    func WeatherData4() {
        // สร้าง URL
        let url = "https://api.open-meteo.com/v1/forecast?latitude=15.875&longitude=101.0&hourly=temperature_2m"
        
        // ทำการเรียก API ด้วย Alamofire
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                // ดึงข้อมูล JSON ออกมาแสดง
                if let json = value as? [String: Any],
                   let hourlyData = json["hourly"] as? [String: Any],
                   let timeArray = hourlyData["time"] as? [String],
                   let temperatureArray = hourlyData["temperature_2m"] as? [Double] {
                    
                    // ดึงข้อมูลอุณหภูมิในช่วงเวลาตั้งแต่ 0 ถึง 23 นาฬิกา
                    let temperatures4 = Array(temperatureArray[72..<95])
                    
                    // หาค่า min และ max
                    let minTemperature = temperatures4.min() ?? 0
                    let maxTemperature = temperatures4.max() ?? 0
                    
                    let minTempValue = Int(minTemperature)
                    let maxTempValue = Int(maxTemperature)
                    
                    // แปลงวันที่
                    let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm" // รูปแบบเวลาจาก JSON
                    let date = dateFormatter.date(from: timeArray[93]) // วันที่ในช่วงเวลาที่ต้องการ
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // กำหนด locale
                        dateFormatter.dateFormat = "d/M    EEEE" // รูปแบบที่ต้องการแสดง
                    let dateString = dateFormatter.string(from: date!) // แปลงวันที่เป็นสตริง
                   
                    // แสดงผลทั้งคู่ผ่าน tempLabel4
                    DispatchQueue.main.async {
                        self.tempLabel4.text = "\(minTempValue)°/\(maxTempValue)°"
                        self.dateLabel4.text = dateString
                    }
                }
            case .failure(let error):
                // แสดง Error กรณีเกิดข้อผิดพลาด
                print("Error: \(error)")
            }
        }
        WeatherData5()
    }
    
    func WeatherData5() {
        // สร้าง URL
        let url = "https://api.open-meteo.com/v1/forecast?latitude=15.875&longitude=101.0&hourly=temperature_2m"
        
        // ทำการเรียก API ด้วย Alamofire
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                // ดึงข้อมูล JSON ออกมาแสดง
                if let json = value as? [String: Any],
                   let hourlyData = json["hourly"] as? [String: Any],
                   let timeArray = hourlyData["time"] as? [String],
                   let temperatureArray = hourlyData["temperature_2m"] as? [Double] {
                    
                    // ดึงข้อมูลอุณหภูมิในช่วงเวลาตั้งแต่ 0 ถึง 23 นาฬิกา ของวันที่ 5 พฤษภาคม 2024
                    let temperatures5 = Array(temperatureArray[96..<119])
                    
                    // หาค่า min และ max
                    let minTemperature = temperatures5.min() ?? 0
                    let maxTemperature = temperatures5.max() ?? 0
                    
                    let minTempValue = Int(minTemperature)
                    let maxTempValue = Int(maxTemperature)
                    
                    // แปลงวันที่
                    let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm" // รูปแบบเวลาจาก JSON
                    let date = dateFormatter.date(from: timeArray[117]) // วันที่ในช่วงเวลาที่ต้องการ
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // กำหนด locale
                        dateFormatter.dateFormat = "d/M    EEEE" // รูปแบบที่ต้องการแสดง
                    let dateString = dateFormatter.string(from: date!) // แปลงวันที่เป็นสตริง
                   
                    // แสดงผลทั้งคู่ผ่าน tempLabel5
                    DispatchQueue.main.async {
                        self.tempLabel5.text = "\(minTempValue)°/\(maxTempValue)°"
                        self.dateLabel5.text = dateString
                    }
                }
            case .failure(let error):
                // แสดง Error กรณีเกิดข้อผิดพลาด
                print("Error: \(error)")
            }
        }
        WeatherData6()
    }
    
    func WeatherData6() {
        // สร้าง URL
        let url = "https://api.open-meteo.com/v1/forecast?latitude=15.875&longitude=101.0&hourly=temperature_2m"
        
        // ทำการเรียก API ด้วย Alamofire
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                // ดึงข้อมูล JSON ออกมาแสดง
                if let json = value as? [String: Any],
                   let hourlyData = json["hourly"] as? [String: Any],
                   let timeArray = hourlyData["time"] as? [String],
                   let temperatureArray = hourlyData["temperature_2m"] as? [Double] {
                    
                    // ดึงข้อมูลอุณหภูมิในช่วงเวลาตั้งแต่ 0 ถึง 23 นาฬิกา ของวันที่ 5 พฤษภาคม 2024
                    let temperatures6 = Array(temperatureArray[120..<143])
                    
                    // หาค่า min และ max
                    let minTemperature = temperatures6.min() ?? 0
                    let maxTemperature = temperatures6.max() ?? 0
                    
                    let minTempValue = Int(minTemperature)
                    let maxTempValue = Int(maxTemperature)
                    
                    // แปลงวันที่
                    let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm" // รูปแบบเวลาจาก JSON
                    let date = dateFormatter.date(from: timeArray[141]) // วันที่ในช่วงเวลาที่ต้องการ
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // กำหนด locale
                        dateFormatter.dateFormat = "d/M   EEEE" // รูปแบบที่ต้องการแสดง
                    let dateString = dateFormatter.string(from: date!) // แปลงวันที่เป็นสตริง
                   
                    
                    // แสดงผลทั้งคู่ผ่าน tempLabel6
                    DispatchQueue.main.async {
                        self.tempLabel6.text = "\(minTempValue)°/\(maxTempValue)°"
                        self.dateLabel6.text = dateString
                    }
                }
            case .failure(let error):
                // แสดง Error กรณีเกิดข้อผิดพลาด
                print("Error: \(error)")
            }
        }
        WeatherData7()
    }
    
    func WeatherData7() {
        // สร้าง URL
        let url = "https://api.open-meteo.com/v1/forecast?latitude=15.875&longitude=101.0&hourly=temperature_2m"
        
        // ทำการเรียก API ด้วย Alamofire
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                // ดึงข้อมูล JSON ออกมาแสดง
                if let json = value as? [String: Any],
                   let hourlyData = json["hourly"] as? [String: Any],
                   let timeArray = hourlyData["time"] as? [String],
                   let temperatureArray = hourlyData["temperature_2m"] as? [Double] {
                    
                    // ดึงข้อมูลอุณหภูมิในช่วงเวลาตั้งแต่ 0 ถึง 23 นาฬิกา ของวันที่ 5 พฤษภาคม 2024
                    let temperatures7 = Array(temperatureArray[144..<167])
                    
                    // หาค่า min และ max
                    let minTemperature = temperatures7.min() ?? 0
                    let maxTemperature = temperatures7.max() ?? 0
                    
                    let minTempValue = Int(minTemperature)
                    let maxTempValue = Int(maxTemperature)
                    
                    // แปลงวันที่
                    let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm" // รูปแบบเวลาจาก JSON
                    let date = dateFormatter.date(from: timeArray[165]) // วันที่ในช่วงเวลาที่ต้องการ
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // กำหนด locale 
                        dateFormatter.dateFormat = "d/M    EEEE" // รูปแบบที่ต้องการแสดง
                    let dateString = dateFormatter.string(from: date!) // แปลงวันที่เป็นสตริง
                   
                    // แสดงผลทั้งคู่ผ่าน tempLabel7
                    DispatchQueue.main.async {
                        self.tempLabel7.text = "\(minTempValue)°/\(maxTempValue)°"
                        self.dateLabel7.text = dateString
                    }
                }
            case .failure(let error):
                // แสดง Error กรณีเกิดข้อผิดพลาด
                print("Error: \(error)")
            }
        }
    }
}
