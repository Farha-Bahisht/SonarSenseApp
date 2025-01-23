//
//  CoreBluetooth.swift
//  SonarSenseApp
//
//  Created by Farha Bahisht on 11/21/24.
//

import CoreBluetooth
import SwiftUI

class BluetoothManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    @Published var isConnected: Bool = false // Tracks connection status
    
    var centralManager: CBCentralManager!
    var connectedPeripheral: CBPeripheral?

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("Bluetooth is ON. Scanning for devices...")
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        case .poweredOff:
            print("Bluetooth is OFF. Please enable it.")
        case .unsupported:
            print("Bluetooth is not supported on this device.")
        default:
            print("Bluetooth state is unknown.")
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        print("Discovered device: \(peripheral.name ?? "Unknown")")
        connectedPeripheral = peripheral
        centralManager.stopScan()
        centralManager.connect(peripheral, options: nil)
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to: \(peripheral.name ?? "Unknown Device")")
        isConnected = true // Update connection status
        connectedPeripheral?.delegate = self
    }
}
