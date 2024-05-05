//
//  temp5ViewController.swift
//  WeatherApp
//
//  Created by Nice on 6/5/2567 BE.
//

import UIKit
import Alamofire

class temp5ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tempP1: UILabel!
    @IBOutlet weak var tempP2: UILabel!
    @IBOutlet weak var tempP3: UILabel!
    @IBOutlet weak var tempP4: UILabel!
    @IBOutlet weak var tempP5: UILabel!
    @IBOutlet weak var tempP6: UILabel!
    @IBOutlet weak var tempP7: UILabel!
    @IBOutlet weak var tempP8: UILabel!
    @IBOutlet weak var tempP9: UILabel!
    @IBOutlet weak var tempP10: UILabel!
    @IBOutlet weak var tempP11: UILabel!
    @IBOutlet weak var tempP12: UILabel!
    @IBOutlet weak var tempP13: UILabel!
    @IBOutlet weak var tempP14: UILabel!
    @IBOutlet weak var tempP15: UILabel!
    @IBOutlet weak var tempP16: UILabel!
    @IBOutlet weak var tempP17: UILabel!
    @IBOutlet weak var tempP18: UILabel!
    @IBOutlet weak var tempP19: UILabel!
    @IBOutlet weak var tempP20: UILabel!
    @IBOutlet weak var tempP21: UILabel!
    @IBOutlet weak var tempP22: UILabel!
    @IBOutlet weak var tempP23: UILabel!
    @IBOutlet weak var tempP24: UILabel!

    @IBAction func backButton(_ sender: Any) {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "VC1") as! ViewController
        navigationController?.pushViewController(vc1, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    
    func fetchData() {
            // URL ของ API
            let Url = "https://api.open-meteo.com/v1/forecast?latitude=15.8700&longitude=100.9925&hourly=temperature_2m"

            // เรียกใช้ Alamofire เพื่อดึงข้อมูล
            AF.request(Url).responseJSON { response in
                switch response.result {
                case .success(let value):
                    // แปลงข้อมูล JSON ให้เป็น NSDictionary
                    if let json = value as? [String: Any] {
                        // ดึงข้อมูลสภาพอากาศออกมา
                        if let hourlyData = json["hourly"] as? [String: Any],
                           let timeArray = hourlyData["time"] as? [String],
                           let temperature_2m = hourlyData["temperature_2m"] as? [Double] {
                            
                            // แปลงวันที่
                            let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm" // รูปแบบเวลาจาก JSON
                            let date = dateFormatter.date(from: timeArray[75]) // วันที่ในช่วงเวลาที่ต้องการ
                            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // กำหนด locale
                                dateFormatter.dateFormat = "EEEE, MMMM d" // รูปแบบที่ต้องการแสดง
                            let dateString = dateFormatter.string(from: date!) // แปลงวันที่เป็นสตริง
                            
                            // อัปเดต UILabels ด้วยข้อมูลอากาศ
                            self.tempP1.text = "\(temperature_2m[72])°"
                            self.tempP2.text = "\(temperature_2m[73])°"
                            self.tempP3.text = "\(temperature_2m[74])°"
                            self.tempP4.text = "\(temperature_2m[75])°"
                            self.tempP5.text = "\(temperature_2m[76])°"
                            self.tempP6.text = "\(temperature_2m[77])°"
                            self.tempP7.text = "\(temperature_2m[78])°"
                            self.tempP8.text = "\(temperature_2m[79])°"
                            self.tempP9.text = "\(temperature_2m[80])°"
                            self.tempP10.text = "\(temperature_2m[81])°"
                            self.tempP11.text = "\(temperature_2m[82])°"
                            self.tempP12.text = "\(temperature_2m[83])°"
                            self.tempP13.text = "\(temperature_2m[84])°"
                            self.tempP14.text = "\(temperature_2m[85])°"
                            self.tempP15.text = "\(temperature_2m[86])°"
                            self.tempP16.text = "\(temperature_2m[87])°"
                            self.tempP17.text = "\(temperature_2m[88])°"
                            self.tempP18.text = "\(temperature_2m[89])°"
                            self.tempP19.text = "\(temperature_2m[90])°"
                            self.tempP20.text = "\(temperature_2m[91])°"
                            self.tempP21.text = "\(temperature_2m[92])°"
                            self.tempP22.text = "\(temperature_2m[93])°"
                            self.tempP23.text = "\(temperature_2m[94])°"
                            self.tempP24.text = "\(temperature_2m[95])°"
                            self.titleLabel.text = dateString
                            // อัปเดต Label อื่น ๆ ตามลำดับ tempP3, tempP4, ..., tempP24
                            // โดยใช้ index ในการเข้าถึงค่าในอาเรย์ temperature_2m
                        }
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
}
