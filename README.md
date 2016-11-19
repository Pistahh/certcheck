# Certificate checker

The primarily purpose of this script is to check how many more days an SSL certificate is valid on a site.

It should be easy to integrate into monitoring tools (e.g. Zabbix).

## Usage

	certcheck [-h] [-f] [-t] [-d] SERVICE
	
	Cert Checker
	
	positional arguments:
	  SERVICE     Service to check: HOST[:PORT]
	
	optional arguments:
	  -h, --help  show this help message and exit
	  -f          Show only 'from' date
	  -t          Show only 'to' date
	  -d          Show days until expiry

## Examples

    % certcheck google.com
    From: 20161110154553Z
    To: 20170202153100Z
    Days remaining: 74
    % certcheck -d google.com:443
    74
    %

## Building

The script "build.sh" can be used to build Debian and Arch linux packages. It needs fpm (the Effing Package Manager).

