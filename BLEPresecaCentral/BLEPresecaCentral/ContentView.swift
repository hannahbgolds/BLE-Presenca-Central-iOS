//
//  ContentView.swift
//  BLEPresecaCentral
//
//  Created by Hannah Goldstein on 31/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var bleManager = BLECentralManager()

    var body: some View {
        NavigationView {
            List(bleManager.detectedUUIDs, id: \.self) { uuid in
                Text("Aluno com UUID: \(uuid.uuidString)")
            }
            .navigationTitle("Presenças Detectadas")
        }
    }
}

#Preview {
    ContentView()
}
