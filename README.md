# peer_code_review trucker monitoring 

This process is made to monitor the progress on the trucker experiment in villages. Enumerators fill in multiple variables for each village and the report gives some descriptive statisics to monitor the progress. 
R scripts are in the src folder. The master file sets the working directory and paths to data and runs the following scripts. There is a cleaning script that makes transformations on the original data, and the Rmarkdown that creates the monitoring report. 

Things to consider:
1. Data is in the input folder
2. Update master script with own paths in lines 18, 19 and 20
3. Keep the outputs folder to store the transformed data to be used on the report
