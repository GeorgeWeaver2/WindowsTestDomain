thisis to document a few atempts in my home lab

Problem #1
How to alow users to add printers them selfs. Some enviorments will use a print sofware like print logic, which is asoftwar ethat goes on to of hte print sever and allows user sto search for printer.

    1) you can do settings > printers> add printers, but this pulls every printer in the network.
    2) you can do \\prtsvr\Printer, but thats not really self server.


    3) you can use a Group policy objectt to auto maticaly install printers by location.


    4) push printing up to windows universal print server. This moves the printing to the MS cloud, but has 2 requirements. First it requires a e3,e5 or standalone license., and it limits your printing to 100 print jobs a month

    steps:
        1) install the Universla Print connector on the print server
        ![alt text](image.png)
        2) register printers
        ![alt text](image-1.png)

        3) 


Prolbem 2)
2) how to ensure that all devices have the same applications