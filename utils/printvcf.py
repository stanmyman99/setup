import sys

class Contact:
    def __init__(self):
        self.name = ""
        self.phones = []
        self.emails = []
        self.addresses = []

    def __str__(self):
        return f"{self.name} - {self.phones} - {self.emails} - {self.addresses}"

    def __repr__(self):
        return str(self)
       

def printvcf(vcf_file):
    contacts = []
    c = None
    with open(vcf_file, 'r') as f:
        for line in f:
            tokens = line.strip().split(':')
            if (len(tokens) > 1):
                Key = tokens[0]
                Value = tokens[1]
                KeyTokens = Key.split(";")
                if Key == 'BEGIN':
                    #print("Creating new contact")
                    c = Contact()
                elif Key == 'END':
                    if c:
                        #print(f"Adding new contact to the list {c}")
                        print("")
                        contacts.append(c)
                        c = None
                elif Key == "VERSION" or Key == 'N' or Key=="NOTE":
                    pass
                elif Key == "FN":
                    print(f"{Value}")
                    print("-"*len(Value))
                elif len(KeyTokens) > 1 and KeyTokens[0] == "TEL":
                    print (f"{Value} ({KeyTokens[1].strip('X-')})")
                else:
                    print(f"{Value.strip(';')}")
    return contacts

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python vcf_reader.py <vcf_file>")
        sys.exit(1)

    vcf_file = sys.argv[1]
    print("")
    contacts = printvcf(vcf_file)
    #print(contacts)
