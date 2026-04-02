
**Problem #1**
How to allow users to add printers them selfs. Some enviornments will use a print sofware like print logic, which is asoftwar ethat goes on to of hte print sever and allows user sto search for printer.

options for adding Printer
1) you can do settings > printers> add printers. However this pulls every printer in the network.
2) you can do \\prtsvr\Printer. This works but some users will not understand how to serach for  their printer
3) you can use a Group policy object to auto maticaly install printers by location.

#add gpo here

4) push printing up to windows universal print server. This moves the printing to the MS cloud, but has 2 requirements. First it requires a e3,e5 or standalone license., and it limits your printing to 100 print jobs a month

steps:
    1) install the Universla Print connector on the print server
        ![alt text](image-5.png)
    2) register printers
    ![alt text](image-1.png)

    3) 
4) run script about 3 minutes after nstall, which gets the computer IP address and instale

5) create a ms logic app that get sa list of the aiavlbe printer and alows hte user to choose thiers

6) Add each printer network location as a win32 app that can be installed by the

