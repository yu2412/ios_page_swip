//
//  Item.swift
//  Bluetooth_test
//
//  Created by 東山友輔 on 2025/02/11.
//

import Foundation
import SwiftData

class UserSettings: ObservableObject {
    @Published var SERVICE_UUID : String = "4fafc201-1fb5-459e-8fcc-c5c9c331914b"

    @Published var CHARACTERISTIC_ID: String {
        didSet { UserDefaults.standard.set(CHARACTERISTIC_ID, forKey: "characteristicID") }
    }
    
    init() {
        self.CHARACTERISTIC_ID = UserDefaults.standard.string(forKey: "characteristicID") ?? "4880488"
    }
}
