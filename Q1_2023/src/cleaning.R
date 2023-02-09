############################################################
## Peer code review
## February 9 2023
## Author: Juliana Guerrero Velasquez
## DIME 1
## cleaning script
############################################################

## read data
# villages
mnt <- read.csv(file.path(input, "Trucker monitoring.csv"))
# crops
crops <- read.csv(file.path(input, "Trucker monitoring-survey-crop_transp.csv"))
# truckers
truc <- read.csv(file.path(input, "Trucker monitoring-survey-trucker.csv"))



## cleaning
# add crop name english
crop_id <- read.csv(file.path(input, "crops_id.csv"))
crops = crops %>% left_join(crop_id[,c('crop_id','name_eng')],
                            by='crop_id')


# remove duplicated villages  values and keep last
mnt =  mnt %>% group_by(village_id) %>% 
  filter(row_number()==n())


# manually modify missing values in village 27010404 
# and number farmers in village 36140105 
mnt = mnt %>% 
  mutate(district=ifelse(village_id=='27010404','Muhanga',district),
         trucker_present=ifelse(village_id=='27010404',1,trucker_present),
         num_truckers=ifelse(village_id=='27010404',1,num_truckers),
         trucker_count=ifelse(village_id=='27010404',1,trucker_count),
         number_farmers=ifelse(village_id=='27010404',3,
                               ifelse(village_id=='36140105',4,number_farmers)))

## Save outputs
write.csv(crops,file.path(output,"crops_upd.csv"))
write.csv(mnt,file.path(output,"mnt_upd.csv"))