# 🍎 BLE-Presença - Central iOS

Este repositório contém o aplicativo iOS que atua como **central BLE**, escaneando os dispositivos Android ou iOS que anunciam presença via Bluetooth Low Energy. Este é o papel do **professor** no sistema de controle de presença automática.

> 📡 Para o app que atua como periférico (aluno), acesse o repositório [BLE-Presenca-Peripheral-Android](https://github.com/seu-usuario/BLE-Presenca-Peripheral-Android)

---

## 🧩 Visão Geral do Sistema

| Papel     | Dispositivo | Função                  | Ação                          |
|-----------|-------------|-------------------------|-------------------------------|
| Professor | iPhone      | Central (Scanner BLE)   | Escaneia os alunos presentes  |
| Aluno     | Android ou iPhone | Periférico (Advertiser) | Anuncia sua presença via BLE  |

---

## 🧪 Arquivos do Projeto (iOS)

- `BLECentralManager.swift` – Lógica de escaneamento BLE
- `ContentView.swift` – Interface com lista dos alunos detectados
- `Info.plist` – Permissões de uso de Bluetooth:

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Este app precisa do Bluetooth para escanear alunos presentes na sala.</string>
<key>NSBluetoothPeripheralUsageDescription</key>
<string>Este app escaneia dispositivos BLE para registrar presença.</string>
```
