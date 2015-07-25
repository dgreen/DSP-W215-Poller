# Sample Soap Request

From:  http://www.w3schools.com/webservices/ws_soap_example.asp

```
POST /InStock HTTP/1.1
Host: www.example.org
Content-Type: application/soap+xml; charset=utf-8
Content-Length: nnn

<?xml version="1.0"?>
<soap:Envelope
xmlns:soap="http://www.w3.org/2001/12/soap-envelope"
soap:encodingStyle="http://www.w3.org/2001/12/soap-encoding">

<soap:Body xmlns:m="http://www.example.org/stock">
  <m:GetStockPrice>
    <m:StockName>IBM</m:StockName>
  </m:GetStockPrice>
</soap:Body>

</soap:Envelope>
```

Left here for those who follow.  Ultimately, the DSP-W215 uses both basic authentication
(handled by curl below) as well as additional "HNAP" authentication which does not seem
to be documented in the open.  It is possible to

  1. Explore the data flowing between an APP and the plug to see examples of the protocol and security
  2. Disassemble to Android app to understand the additional security.  

The above will take a while and was only just started as part of this effort.

Possibly add

`SOAPAction: "http://purenetworks.com/HNAP1/SetDeviceSettings"`

to header

```
POST /HNAP1/GetDeviceSettings HTTP/1.1
Host: 192.168.11.7
Content-Type: application/soap+xml; charset=utf-8
Content-Length: nnn

 <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xmlns:xsd="http://www.w3.org/2001/XMLSchema"
 xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
<soap:Body xmlns:d="http://purenetworks.com/HNAP1/">
  <d:GetDeviceSettings xmlns="http://purenetworks.com/HNAP1/">
  </d:GetDeviceSettings>
</soap:Body>
</soap:Envelope>
```


```
curl -u 'root:588150' -H 'SOAPAction: "http://purenetworks.com/HNAP1/GetDeviceSettings"' -d @getdevset.txt  http://192.168.11.7/HNAP1
```

https://isc.sans.edu/forums/diary/More+on+HNAP+What+is+it+How+to+Use+it+How+to+Find+it/17648/

http://www.devttys0.com/2014/05/hacking-the-d-link-dsp-w215-smart-plug/

Turn on device:  `/var/sbin/relay 1`

Turn off device: `/var/sbin/relay 0`

Credentials:  admin  / <id number>


