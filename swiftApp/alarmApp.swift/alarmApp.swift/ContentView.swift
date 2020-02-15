//
//  ContentView.swift
//  alarmApp.swift
//
//  Created by tokunakaharuyuki on 2020/02/16.
//  Copyright © 2020 M&B company. All rights reserved.
//

import SwiftUI

struct ShakeTimeView: View {
    @ObservedObject var shakeTime: ShakeTime
    
    
    var body: some View {
        Toggle(isOn: $shakeTime.isOn) {
            Text(String(format: "%02d:%02d", shakeTime.hour, shakeTime.minute))
                .bold()
                .font(.largeTitle)
            
        }
        .padding(.horizontal)
        .frame(height: 80.0)
    }
}

class ShakeTime: ObservableObject, Identifiable {
    var hour = 0
    var minute = 0
    var isOn = false {
        didSet {
            if isOn{
                LocalPushCenter.sendLocaiPush(hour: hour, minute: minute)
            }
        }
    }
}

class LocalPushCenter {
    static func sendLocalPush(hour: Int, minute: Int){
        let timeString = String(format: "%02d:%02d", hour, minute)
        let content = UNMutableNotificationContent()
        content.title = "起こします"
        content.subtitle = "\(timeString)のアラーム"
        content.body = "アラームの時間ですよ〜"
        content.sound = UNNotificationSound.default  //UNNotificationSound(named:)で任意の音を設定可
        let component = DateComponents(hour: hour, minute: minute, second: 0, nanosecond: 0)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: false)
        let request = UNNotificationRequest(identifier: "TIMER \(timeString)", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.delegate = (UIApplication.shared.delegate as! AppDelegate)
        center.add(request) { (error) in if let error = error {
            print(error.localizedDescription)
            
            }
        }
    }
}
struct shakeTimeView_Previews: PreviewProvider {
    static var previews: some View {
        let shakeTime = ShakeTime()
        shakeTime.hour = 22
        return ShakeTimeView(shakeTime: shakeTime)
            .previewLayout(.fixed(widht: 400, height:80))
    }
}
