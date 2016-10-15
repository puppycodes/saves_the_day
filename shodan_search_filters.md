| Name	| Description	| Type |
|--------| ------------| ---  |
|after|Only show results after the given date (dd/mm/yyyy)|string|
|asn|Autonomous system number|string|
|before|Only show results before the given date (dd/mm/yyyy)|string|
|category|Available categories: ics, malware|string|
|city|Name of the city|string|
|country|2-letter country code|string|
|geo|Accepts between 2 and 4 parameters. If 2 parameters: latitude,longitude. If 3 parameters: latitude,longitude,range. If 4 parameters: top left latitude, top left longitude, bottom right latitude, bottom right longitude.|string|
|has_ipv6|True/ False|boolean|
|has_screenshot|True/ False|boolean|
|hostname|Full hostname for the device|string|
|html|HTML of web banners|string|
|ip|Alias for net filter|string|
|isp|ISP managing the netblock|string|
|net|Network range in CIDR notation (ex. 199.4.1.0/24)|string|
|org|Organization assigned the netblock|string|
|os|Operating system|string|
|port|Port number for the service|integer|
|postal|Postal code (US-only)|string|
|product|Name of the software/ product providing the banner|string|
|region|Name of the region/ state|string|
|state|Alias for region|string|
|title|Title for the web banner’s website|string|
|version|Version for the product|string|
|vuln|CVE ID for a vulnerability|string|
|http.component|Name of web technology used on the website|string|
|http.component_category|Category of web components used on the website|string|
|http.html|HTML of web banners|string|
|http.html_hash|Hash of the website HTML|integer|
|http.status|Response status code|integer|
|http.title|Title for the web banner’s website|string|
|ntp.ip|IP addresses returned by monlist|string|
|ntp.ip_count|Number of IPs returned by initial monlist|integer|
|ntp.more|True/ False; whether there are more IP addresses to be gathered from monlist|boolean|
|ntp.port|Port used by IP addresses in monlist|integer|
|has_ssl|True/ False|boolean|
|ssl|Search all SSL data|string|
|ssl.alpn|Application layer protocols such as HTTP/2 (“h2”)|string|
|ssl.chain_count|Number of certificates in the chain|integer|
|ssl.version|Possible values: SSLv2, SSLv3, TLSv1, TLSv1.1, TLSv1.2|string|
|ssl.cert.alg|Certificate algorithm|string|
|ssl.cert.expired|True/ False|boolean|
|ssl.cert.extension|Names of extensions in the certificate|string|
|ssl.cert.serial|Serial number as an integer or hexadecimal string	integer|string|
|ssl.cert.pubkey.bits|Number of bits in the public key|integer|
|ssl.cert.pubkey.type|Public key type|string|
|ssl.cipher.version|SSL version of the preferred cipher|string|
|ssl.cipher.bits|Number of bits in the preferred cipher|integer|
|ssl.cipher.name|Name of the preferred cipher|string|
|telnet.option|Search all the options|string|
|telnet.do|string	The server requests the client do support these options string telnet.dont The server requests the client to not support these options string telnet.will The server supports these options string telnet.wont The server doesn’t support these options|string|
|telnet.dont|The server requests the client to not support these options|string|
|telnet.will|The server supports these options|string|
|telnet.wont|The server doesn’t support these options|string|
