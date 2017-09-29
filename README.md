# SASlogreviewer  ("Just use R...")
Review Batch SAS log output for Errors and Warnings

#Problem:
SAS is the primary statistical package used for several of my projects. These projects can have a large number of individual programs that must be run in a batch submission. As a quality control measure, we must review the SAS log produced with each program.

#Solution
Instead of manually searching each file for keywords that indicate errors "Error:", "Warning:", and "Uninitailized". I wrote an R script that looks for all the log files in a folder and extracts only lines with these key words. The results are saved to a text file for manual review and future debugging.
