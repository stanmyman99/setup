import socket
import json
import time
from collections import defaultdict

# Define a simple DeviceTracker class
class DeviceTracker:
    def __init__(self):
        self.devices = {}  # Stores information about devices by MAC address

    def track_device(self, device_info):
        mac_address = device_info['mac_address']
        current_time = device_info['timestamp']

        # If it's the first time seeing this device, add it
        if mac_address not in self.devices:
            self.devices[mac_address] = {
                "name": device_info['name'],
                "first_seen": current_time,
                "count": 1,
                "timestamps": [current_time]
            }
        else:
            # Increment the count and add the timestamp if 15 minutes have passed
            device_data = self.devices[mac_address]
            last_seen_time = device_data["timestamps"][-1]

            if current_time - last_seen_time > 15 * 60:  # 15 minutes in seconds
                device_data["count"] += 1
                device_data["timestamps"].append(current_time)

        print(f"Device {mac_address} tracked: {self.devices[mac_address]}")

    def get_device_report(self):
        return self.devices

# Server that receives and processes device information
def start_server(host="127.0.0.1", port=65432):
    device_tracker = DeviceTracker()

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
        server_socket.bind((host, port))
        server_socket.listen()

        print("Server is listening for incoming connections...")

        while True:
            conn, addr = server_socket.accept()
            with conn:
                print(f"Connected by {addr}")
                data = conn.recv(1024)  # Receive device data (max 1024 bytes)
                
                if not data:
                    break
                
                # Parse the incoming device info
                device_info = json.loads(data.decode('utf-8'))
                device_tracker.track_device(device_info)

                # Optionally, send back a response or log something
                conn.sendall(b"Device info received")

            # Optionally print a summary of tracked devices
            print("Current devices tracked:")
            for mac, info in device_tracker.get_device_report().items():
                print(f"{mac}: {info}")

if __name__ == "__main__":
    print("Starting up the Bluetooth monitoring server")
    start_server()
