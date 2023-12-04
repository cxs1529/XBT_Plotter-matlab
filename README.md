# NEW 2023 XBT GUI PLOTTER

*MATLAB source files, Windows executable* 

Developed in MATLAB, so you can run the App with MATLAB, or just run the EXE (Windows) with the Matlab Runtime.  
 
The basic tools are Map plotter, Profile Plotter, Metadata display, and export of binary files to ascii (.txt).  
You can work with the ftp server or pick local files and work in the same way.  

The zip file contains the executables:  
1- *for_redistribution* has the installer. It will install the Matlab runtime and send a shortcut to the executable to the desktop.  
2- *for_redistribution_files_only* has the executable. Use this one if you already have the runtime installed.

If you have Matlab installed, you can also run it using the XBTPlotterApp.mlapp.  
You should have the AppDesigner enabled and keep all the files contained in the MATLAB_Scripts folder in the same local directory.  

## MAIN TAB

![main](https://github.com/cxs1529/XBT_Plotter-matlab/assets/150298128/0e2df880-4d63-4758-8556-82b63a986dd2)

On this tab you have 2 options: (A) Work on the FTP and (B) Work with locally picked files.  
(A) FTP: The ftp has a Date filter: 1st select the range of dates, so it will browse and return the list of remote files that correspond to that condition (based on the filename format YYYMMDD).  
Then select among the available Callsigns. You can select multiple ships and will be plotted in different colors. Click Plot to display the map, and it will first download the binary files to the working directory, in the XBTplotter_downloads directory.  
(B) Local: Select one or more files from a local directory.  

**MAP**:  
Click on the map and then you can use the arrow keys, and the +/- to move or zoom in/out.  
Click on any of the deployment sites to decode, plot the profile and display the metadata.  
Click on the green button to export the file as ASCII in .txt format. It will be saved in the working directory path, in the XBTascii_export directory.  

## CONFIG TAB#

![config](https://github.com/cxs1529/XBT_Plotter-matlab/assets/150298128/3f6284ae-16ec-47f7-a52e-cd5776c37454)


- Change the ftp credentials, if we ever move the files from the current directory.  
- Set the Working directory where files are downloaded and exported.  
- Change the map type. Matlab comes with a few different maps to play with.  
- Change the scale factor that is used as a measure to PAN and ZOOM, in degrees [d.ddd].  
- Save the configuration and it will be loaded next time you use the app.

## TABLE TAB

![table](https://github.com/cxs1529/XBT_Plotter-matlab/assets/150298128/15e1d77e-1a53-4aa1-adc9-3f8894b5b0d6)


