#!/bin/bash

# Simple version - edit the variables below with your information

FULL_NAME="Julian Elias Sibaja Garcia"
CEDULA="1043020227"
EMAIL="jusiba84@gmail.com"
COUNTRY="CO"
STATE="Atlantico"
CITY="Sabanalarga"
DAYS_VALID=365
PASSWORD="thedragonbeatsthetiger"


# Generate private key
openssl genrsa -out private_key.pem 2048

# Create certificate (Organization field is optional)
openssl req -new -x509 -key private_key.pem -out certificate.pem -days $DAYS_VALID \
  -subj "/C=$COUNTRY/ST=$STATE/L=$CITY/CN=$FULL_NAME/emailAddress=$EMAIL" \
  -addext "1.2.3.4.5.6.7.8=ASN1:UTF8String:$CEDULA"

# Create PKCS#12 file
openssl pkcs12 -export -out signing_certificate.p12 -inkey private_key.pem -in certificate.pem -passout pass:$PASSWORD

echo "Certificate generated successfully!"
echo "Files created:"
echo "  - private_key.pem (keep this secure!)"
echo "  - certificate.pem"
echo "  - signing_certificate.p12 (for import into applications)"


