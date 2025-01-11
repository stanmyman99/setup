import argparse
import asyncio
from bleak import BleakScanner
from typing import Optional, Dict, Tuple, List
import socket
import time
import json
import base64

# Manufacturer ID Lookup Table
manufacturer_ids = {
    0x0000: "Ericsson Technology",
    0x004C: "Apple",
    0x0059: "Broadcom",
    0x0064: "Band XI International, LLC",
    0x0109: "Intel",
    0x011F: "Qualcomm",
    0x0123: "STMicroelectronics",
    0x0152: "Microsoft",
    0x0197: "Harman",
    0x02A1: "Nordic Semiconductor",
    0x03F0: "Texas Instruments",
    0x06B1: "Samsung",
    0x0801: "Qualcomm Atheros",
    0x0A5C: "Broadcom (Apple)",
    0x0C1B: "Garmin",
    0x00E0: "Google",
    0x0F00: "Vizio",
    0x10C4: "Cypress Semiconductor",
    0x012D: "Sony Corporation",
    0x18D1: "Google",
    0x1B6D: "Nokia",
    0x1F00: "Fitbit",
    0x1F10: "Huawei",
    0x0224:  "Comarch SA",
    0x2A00: "Sony",
    0x2A10: "Xiaomi",
    0x2B05: "Qualcomm Atheros",
    0x2F3E: "Harman Kardon",
    0x2F7A: "Amazon",
    0x0301: "Giatec Scientific Inc.",
    0x0310: "SGL Italia S.r.l.",
    0x0040: "Seiko Epson Corporation",
    0x4C4F: "NXP Semiconductors",
    0x5089: "Mediatek",
    0x6B02: "Bose",
    0x7B47: "Mellanox",
    0x0076: "Nordic Semiconductor",
    0x0080: "Garmin Ltd.",
    0x0086: "Beijing",
    0x00B4: "Sigma Designs",
    0x00C4: "Nokia",
    0x00CE: "Foxconn",
    0x00F0: "Roku",
    0x00F7: "Sony Ericsson"
}

# Example function to get Manufacturer Name by ID
def get_manufacturer_name(manufacturer_id):
    return manufacturer_ids.get(manufacturer_id, f"Unknown Manufacturer ({hex(manufacturer_id)})")

class CustomJSONEncoder(json.JSONEncoder):
    def default(self, o):
        print(type(o))
        if isinstance(o, bytearray):
            # Convert bytearray to base64-encoded string
            return base64.b64encode(o).decode('utf-8')
        # If it's not a bytearray, let the default encoder handle it
        return super().default(o)

def encode64(bytes):
    return base64.b64encode(bytes).decode('utf-8')

# Convert to JSON with custom encoder
def serialize_device(device):
    #return json.dumps(device.to_dict(), cls=CustomJSONEncoder)
    data = device.to_dict()
    return json.dumps(data)

class btdevice:
    def __init__(
        self,
        d, 
        local_name: Optional[str] = None,
        manufacturer_data: Optional[Dict[int, bytes]] = None,
        platform_data: Optional[Tuple] = None,
        rssi: Optional[int] = None,
        service_data: Optional[Dict[str, bytes]] = None,
        service_uuids: Optional[List[str]] = None,
        tx_power: Optional[int] = None,
        debug: bool = False  # Optional debugging flag
    ):
        # Store the direct variables
        self.bledevice = d 
        self.local_name = local_name
        self.manufacturer_data = manufacturer_data or {}
        self.platform_data = platform_data or ()
        self.rssi = rssi
        self.service_data = service_data or {}
        self.service_uuids = service_uuids or []
        self.tx_power = tx_power

        # Store the derived variables
        self.details = d.details
        self.props = d.details.get('props', {})
        self.address = d.address if hasattr(d, 'address') else None
        self.addresstype = self.props.get('AddressType', None)
        self.connected = self.props.get('Connected', None)
        self.alias = self.props.get('Alias', None)
        self.paired = self.props.get('Paired', None)

        # Manufacturer Data (check if it's not empty)
        mdata = self.props.get('ManufacturerData', {})
        if mdata:
            self.manufacturer = list(mdata.keys())[0]
        else:
            self.manufacturer = None  # Handle missing data

        # Debugging print
        if debug:
            print(self.props)

    def __repr__(self):
        return (
            f"BluetoothAdvertisementData("
            f"local_name={self.local_name!r}, "
            f"manufacturer_data={self.manufacturer_data!r}, "
            f"platform_data={self.platform_data!r}, "
            f"rssi={self.rssi!r}, "
            f"service_data={self.service_data!r}, "
            f"service_uuids={self.service_uuids!r}, "
            f"tx_power={self.tx_power!r})"
        )
    
    def print(self):
        d = self.bledevice
        name = f"Device: {d.address}"
        print(f"{name}")
        print("_" * len(name))
        print(f"Local name:        {self.local_name}")
        print(f"Manufacturer:      {get_manufacturer_name(self.manufacturer)}")
        print(f'Alias:             {self.alias}')
        print(f"TX Power:          {self.tx_power}")
        print(f"Rssi:              {self.rssi}")
        print(f"Address Type:      {self.addresstype}")
        print(f'Connected:         {self.connected}')
        print(f'Paired:            {self.paired}')
        print(f"Service UUIDS:     {self.service_uuids}")
        print(f"Manufacturer Data: {self.manufacturer_data}")
        print(f"Service Data:      {self.service_data}")
        print(f"Platform Data:     {self.platform_data}")
        print()

    def print_manufacturer(self):
        print(f"Manufacturer:      {get_manufacturer_name(self.manufacturer)}")
        
    def print_short(self):
        print(f"{self.local_name}: {get_manufacturer_name(self.manufacturer)}")

    def to_dict(self):
        return {
            "address": self.address,
            "local_name": self.local_name,
            "manufacturer": self.manufacturer,
            "timestamp": time.time(),  # Add a timestamp when sending data
            "rssi": self.rssi,
            "service_uuids": self.service_uuids,
            "tx_power": self.tx_power,
            "connected": self.connected,
            "paired": self.paired,
            "alias": self.alias
            #"props": self.props,  # Include self.props
            #"manufacturer_data": encode64(self.manufacturer_data),  # bytearray is still here
            #"manufacturer_data": self.manufacturer_data,  # bytearray is still here
            #"service_data": self.service_data,  # bytearray is still here
            #"platform_data": self.platform_data  # bytearray is still here
        }

def print_device_list(devicelist, title):
    print("_" * len(title))
    print (title)
    print("_" * len(title))
    print()

    for d in devicelist:
        d.print()
        #d.print_manufacturer()
        #d.print_short()
    
    print(f"Total devices: {len(devicelist)}")
    print("_" * 80)
    print()

def report_device(device, client_socket, server_address):
    sdevice = serialize_device(device)
    print(f"Sending device: {device}")
    print(f"Sending device data: {sdevice}")
    client_socket.sendto(sdevice.encode('utf-8'), server_address)

def process_and_report(client_socket, server_address, devices):
    privatedevices = []
    publicdevices = []
    for d, a in devices.values():
        device = btdevice(d, a.local_name, a.manufacturer_data, a.platform_data, a.rssi, a.service_data, a.service_uuids, a.tx_power)
        if device.addresstype == 'random':
            privatedevices.append(device)
        else:
            publicdevices.append(device)
        report_device(device, client_socket, server_address)
    client_socket.close()

    reportstr = f"Reported {len(publicdevices) + len(privatedevices)} devices, {len(publicdevices)} public and {len(privatedevices)} private."
    print("_" * len(reportstr))
    print(reportstr)
    print("_" * len(reportstr))

    #print_device_list(publicdevices, "Public Devices")
    #print_device_list(privatedevices, "Private Devices")
    

async def main(args: argparse.Namespace):
    # Connect to the server
    server_address = ('localhost', 5000)
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    # Run scanning for 1 hour
    start_time = time.time()
    elapsed_time = 0

    while elapsed_time < 3600:
        print("scanning for 5 seconds, please wait...")
        #scanner = BleakScanner()
        #await scanner.start()
        devices = await BleakScanner.discover(
            return_adv=True,
            #timeout=1.0,
            service_uuids=args.services,
            cb=dict(use_bdaddr=args.macos_use_bdaddr),
        )
        #await scanner.stop()
        process_and_report(client_socket, server_address, devices)
        elapsed_time = time.time() - start_time
        print(f"Elapsed time: {elapsed_time:.1f} seconds")
        print("Pausing for 5 seconds before the next scan...")
        await asyncio.sleep(5)  # Wait for 5 seconds before scanning again


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--services",
        metavar="<uuid>",
        nargs="*",
        help="UUIDs of one or more services to filter for",
    )

    parser.add_argument(
        "--macos-use-bdaddr",
        action="store_true",
        help="when true use Bluetooth address instead of UUID on macOS",
    )

    args = parser.parse_args()

    asyncio.run(main(args))