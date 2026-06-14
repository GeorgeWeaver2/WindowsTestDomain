This documents my Windows Test domain where I Explore Active directory, DHCP, and DNS

Active Directory
- setup user accounts, with each one having scoped access and RBAC roles

Users:
<img width="255" height="259" alt="image" src="https://github.com/user-attachments/assets/c2904d45-90f9-4d1a-bdb0-ad5adad58489" />

Users have scoped roles to limite access to company data
<img width="405" height="223" alt="image" src="https://github.com/user-attachments/assets/8e3e883c-ac3a-4f4c-94ed-1ddc2ac543b0" />


DHCP
1) Created IP address scope: I intentionally gave the DC a ip address that ddin;'t fail in to the range to prevent an accidental issue with
<img width="832" height="329" alt="image" src="https://github.com/user-attachments/assets/417362d2-6f24-45fd-a544-e47a7ce5edfd" />

2) Added DNS server in Scope options to that clients are told were routt DNs queries to
   <img width="603" height="104" alt="image" src="https://github.com/user-attachments/assets/574b31c1-8259-4a1a-96dc-fc2756426a13" />

3) added reservations for perminent network devices, such as printer, since it's being managed by DHCP. If a device not being centralling managed on windwos dhcp server such as satelittle site printers, then you could use a DHCP exclusion, but here I'm doing a reservations:
<img width="676" height="604" alt="image" src="https://github.com/user-attachments/assets/4c9c1dfb-2f43-49ac-8daa-986db009f179" />









