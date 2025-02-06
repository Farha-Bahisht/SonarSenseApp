//
//  ContentView.swift
//  Sonar Sense
//
//  Created by Freemon, Ziggy on 2/6/25.
//

import SwiftUI
import CoreBluetooth

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

class BluetoothViewController: UIViewController , CBPeripheralDelegate, CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("peripheralManagerDidUpdateState \(central.state.rawValue)")
        
        if central.state == .poweredOn {
            //let service = CBUUID(string: "9f37e282-60b6-42b1-a02f-7341da5e2eba") we can give peripherals white list like this
            self.centralManager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    
    func centralManager(_ centralManager: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {

      // Perform any checks on `advertisementData` to confirm this is the correct device
        print("discovered new device")
      // Attempt to connect to this device
      centralManager.connect(peripheral, options: nil)

      // Retain the peripheral
      //self.peripheral = peripheral
    }
    
    private var centralManager: CBCentralManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("startibg cbcm")
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    
    
}



#Preview {
    ContentView()
}
