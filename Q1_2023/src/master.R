############################################################
## Peer code review
## February 9 2023
## Author: Juliana Guerrero Velasquez
## DIME 1
## master script
############################################################

# Delete everything already in R memory
rm(list = ls())

## Load libraries 
pacman::p_load(tidyverse, kableExtra,rmarkdown)
options(scipen=5)
theme_set(theme_minimal())

## File Paths
input  <- file.path("D:/DIME/peer_code_review/peer_code_review/Q1_2023/input")
output <- file.path("D:/DIME/peer_code_review/peer_code_review/Q1_2023/output")
src <- file.path("D:/DIME/peer_code_review/peer_code_review/Q1_2023/src")

## Running scripts 
# Clean and construct data
source(file.path(src, "cleaning.R"))
# Run markdown report
rmarkdown::render(file.path(src, "analysis_report.Rmd"), "html_document")
