# mikrotik-bgp-threat-feed
Integration of Mikrotik RouterOS and Text file Threat Feed (BGP Blackhole)

This is a very basic integration that can be extended to include additional threat feeds in plain text format. 
In this example I've used the Spamhaus Drop, Extended Drop and IPv6 Drop lists. Additional ones can be added easily.

Instructions:

Edit the configs and replace parameters in <> with the appropriate item. (IP address, Password or other)

Place all .sh scripts in a convenient folder (in my test system I choose /root/bgpf, change if desired). 
Once all files are edited and in the correct place, add a crontab entry for bgpf.sh.

You need Quagga (installed and running) for the BGP integration and these scripts will create and maintain your Quagga configuration. 
In my test system I run the update script once a day at 5am, which results in the latest Threat Feed updates being downloaded,
the Quagga configuration getting populated with those prefixes, and finally the Quagga process getting stopped and restarted,
which results in the latest prefixes being advertised to Mikrotik.

Note the that IPv4 prefixes are set to BLACKHOLE type on Mikrotik, but IPv6 prefixes are set to UNREACHABLE. 
As of RouterOS 6.47.1, IPv6 doesn't recognize a BLACKHOLE type, so UNREACHABLE is the correct choice for those.
