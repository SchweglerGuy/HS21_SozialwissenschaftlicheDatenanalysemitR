# Laden der Daten
#daten_ess <- read.csv(file = "Daten/ESS1-8e01.csv")
#daten_ess <- daten_ess[sample(row.names(daten_ess),200),]
#write.csv(daten_ess, file = "Daten/ESS1-8e01_HS21.csv")
daten_ess <- read.csv(file = "Daten/ESS1-8e01_HS21.csv")


# Definieren von fehlenden Werten
daten_ess$yrbrn[daten_ess$yrbrn==7777 |
                  daten_ess$yrbrn==8888 |
                  daten_ess$yrbrn==9999] <- NA
daten_ess$agea[daten_ess$agea==999] <- NA
daten_ess$edulvla[daten_ess$edulvla>5] <- NA
daten_ess$eisced[daten_ess$eisced>7] <- NA
daten_ess$eduyrs[daten_ess$eduyrs>76] <- NA
daten_ess$wkhtot[daten_ess$wkhtot>200] <- NA
daten_ess$hinctnta[daten_ess$hinctnta>10] <- NA

# Fehler in den Faellen Korrigieren
## Fall 132
daten_ess$agea[daten_ess$x==132] <- 2016 - daten_ess$yrbrn[daten_ess$x==132]
daten_ess$agea[daten_ess$x==132]
## Fall 352
daten_ess$agea[daten_ess$x==352] <- 2016 - daten_ess$yrbrn[daten_ess$x==352]
## Fall 443 
daten_ess$edulvla[daten_ess$x==443] <- NA
## Fall 1414
daten_ess$agea[daten_ess$x==1414] <- NA
daten_ess$yrbrn[daten_ess$x==1414] <- NA
## Fall 1482
daten_ess$eduyrs[daten_ess$x==1482] <- round(mean(daten_ess$eduyrs[daten_ess$edulvla==3],
                                     na.rm = T))

# Faktoren definieren
# Faktoren definieren
## ungeordnete Faktoren
daten_ess$gndr <- factor(daten_ess$gndr, 
                         levels = c(1,2),
                         labels = c("Male", "Female"))
daten_ess$chldhm <- factor(daten_ess$chldhm, 
                           levels = c(1,2),
                           labels = c("Respondent lives with children at household grid",
                                      "Does not"))
daten_ess$pdwrk <- factor(daten_ess$pdwrk, 
                          levels = c(1,2),
                          labels = c("Not marked",
                                     "Marked"))
daten_ess$edctn <- factor(daten_ess$edctn, 
                          levels = c(1,2),
                          labels = c("Not marked",
                                     "Marked"))
daten_ess$uemp3m <- factor(daten_ess$uemp3m, 
                           levels = c(1,2,7,8),
                           labels = c("Yes", "No",
                                      "Refusal", "Don't know"))
## geordnete Faktoren
daten_ess$polintr <- factor(daten_ess$polintr, 
                            levels = c(4,3,2,1),
                            labels = c("Not at all interested", 
                                       "Hardly interested", 
                                       "Quite interested", 
                                       "Very interested"),
                            ordered = T)
daten_ess$edulvla <- factor(daten_ess$edulvla,
                            levels = c(1,2,3,4,5),
                            labels = c("ISCED 0-1",
                                       "ISCED 2",
                                       "ISCED 3",
                                       "ISCED 4",
                                       "ISCED 5-6"),
                            ordered = T)

daten_ess$eisced <- factor(daten_ess$eisced,
                           levels = c(0,1,2,3,4,5,6,7),
                           labels = c("Not possible to harmonise into ES-ISCED",
                                      "ES-ISCED I",
                                      "ES-ISCED II",
                                      "ES-ISCED IIIb",
                                      "ES-ISCED IIIa",
                                      "ES-ISCED IV",
                                      "ES-ISCED V1",
                                      "ES-ISCED V2"),
                           ordered = T)



# nicht benoetigte Variablen loeschen
daten_ess$X <- NULL
daten_ess$x <- NULL
