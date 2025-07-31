//
//  BLECentralManager.swift
//  BLEPresecaCentral
//
//  Created by Hannah Goldstein on 31/07/25.
//

import Foundation
import CoreBluetooth
import Combine

class BLECentralManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    @Published var detectedUUIDs: [UUID] = []
    private var foundDevices: Set<UUID> = []

    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("✅ Bluetooth ligado - iniciando scan")
            centralManager.scanForPeripherals(withServices: nil, options: [
                CBCentralManagerScanOptionAllowDuplicatesKey: false
            ])
        case .poweredOff:
            print("❌ Bluetooth desligado")
        default:
            print("⚠️ Estado Bluetooth: \(central.state.rawValue)")
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any], rssi RSSI: NSNumber) {

        if let localName = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            print("🧑‍🎓 Nome detectado: \(localName)")
        }

        if let serviceUUIDs = advertisementData[CBAdvertisementDataServiceUUIDsKey] as? [CBUUID] {
            if !foundDevices.contains(peripheral.identifier) {
                foundDevices.insert(peripheral.identifier)
                DispatchQueue.main.async {
                    self.detectedUUIDs.append(peripheral.identifier)
                }
                print("📡 Anúncio detectado: \(peripheral.identifier)")
                print("🔍 UUIDs: \(serviceUUIDs.map { $0.uuidString })")
            }
        }
    }
}
