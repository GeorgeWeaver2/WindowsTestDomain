This documents my Windows Test Domain where I explore Active Directory roles and groups, DHCP scopes and reservations, and DNS 

<strong> Active Directory  and user accounts</strong>

1) Add multiple users by CSV
<img width="255" height="259" alt="image" src="https://github.com/user-attachments/assets/c2904d45-90f9-4d1a-bdb0-ad5adad58489" />
 <br> <br>

2) Each user has specific Groups to control what resources they have access to.
<img width="405" height="223" alt="image" src="https://github.com/user-attachments/assets/8e3e883c-ac3a-4f4c-94ed-1ddc2ac543b0" />
<br> <br>
3) Users are also assigned specific roles according to their job. In this cas we allow Edmund the ability to reset the password for non-admin or privileged accounts
<img width="1522" height="269" alt="image" src="https://github.com/user-attachments/assets/b7039d7d-aaba-4d1f-8853-58cc9133c23d" /><br>
 <br> <br>


DHCP
1) Created an IP address scope, and I intentionally gave the DC an IP address outside of the IP scope to prevent IP address conflicts.
<img width="832" height="329" alt="image" src="https://github.com/user-attachments/assets/417362d2-6f24-45fd-a544-e47a7ce5edfd" />
<br> <br>
2) Added DNS server in scope options so that client devices are told where to route DNS queries to
 <img width="603" height="104" alt="image" src="https://github.com/user-attachments/assets/574b31c1-8259-4a1a-96dc-fc2756426a13" />
<br> <br>
3) added reservations for permanent network devices, such as printers, so that they have a known and predictable address. You could use a DHCP exclusion on the router if you had several remote sites with printers and wanted decentralized control, but in this case, the DHCP server can handle the load.
   <br>
<img width="676" height="604" alt="image" src="https://github.com/user-attachments/assets/4c9c1dfb-2f43-49ac-8daa-986db009f179" />
<br> <br>

DNS










