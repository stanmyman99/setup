import socket
import json
from collections import defaultdict
import time

# Dictionary to hold the device data
devices = {}

def handle_device_data(data):
    print(f'handle_device_data')
    device = json.loads(data)
    address = device["address"]
    timestamp = device["timestamp"]

    # If the device is already in the list, update its data
    if address in devices:
        devices[address]['count'] += 1
        devices[address]['last_seen'] = timestamp
    else:
        # Add the new device with the first-seen timestamp
        devices[address] = {
            'first_seen': timestamp,
            'last_seen': timestamp,
            'count': 1,
            'props': device.get('props', {}),
            'service_data': device.get('service_data', {}),
            'platform_data': device.get('platform_data', {}),
        }

def start_server():
    server_address = ('localhost', 5000)
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server_socket.bind(server_address)

    print("Server started, waiting for data...")

    while True:
        data, address = server_socket.recvfrom(4096)
        if data:
            handle_device_data(data)
            print(f"Device data received from {address}: {data.decode()}")

        # Print devices every 10 seconds for monitoring
        time.sleep(10)
        print("\nDevices tracked so far:")
        for addr, info in devices.items():
            first_seen = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(info['first_seen']))
            last_seen = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(info['last_seen']))
            print(f"Device {addr}: First Seen: {first_seen}, Last Seen: {last_seen}, Count: {info['count']}")
            print(f"Props: {info['props']}")
            print(f"Service Data: {info['service_data']}")
            print(f"Platform Data: {info['platform_data']}")
            print("-" * 40)

# Start the server
start_server()
