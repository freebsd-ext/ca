[ req ]
default_bits            = 2048                  # RSA key size
default_days            = 730                   # How long to certify for
encrypt_key             = no                    # Protect private key
default_md              = sha256                # MD to use
utf8                    = yes                   # Input is UTF-8
string_mask             = utf8only              # Emit UTF-8 strings
prompt                  = no                    # Prompt for DN
distinguished_name      = client_dn             # DN template
req_extensions          = client_reqext         # Desired extensions

[ client_dn ]
countryName             = "{{CA_CERT_C}}"
stateOrProvinceName     = "{{CA_CERT_ST}}"
localityName            = "{{CA_CERT_L}}"
organizationName        = "{{CA_CERT_ORG}}"
organizationalUnitName  = "{{CA_CERT_OU}}"
commonName              = "{{CA_USERNAME}}"
emailAddress		= "{{CA_USERNAME}}"

[ client_reqext ]
keyUsage                = critical,digitalSignature
extendedKeyUsage        = clientAuth
subjectKeyIdentifier    = hash
#subjectAltName          = email:move
