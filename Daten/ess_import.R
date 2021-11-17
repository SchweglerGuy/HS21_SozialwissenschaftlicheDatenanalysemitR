# Laden der Daten
#daten_ess <- read.csv(file = "Daten/ESS1-8e01.csv")
#daten_ess <- daten_ess[sample(row.names(daten_ess),200),]
#write.csv(daten_ess, file = "Daten/ESS1-8e01_HS21.csv")
daten_ess <- read.csv(file = "Daten/ESS1-8e01_HS21.csv")

# nicht benoetigte Variablen loeschen
## bisher keine nicht benoetigen Variablen vorhanden


# Definieren von fehlenden Werten
daten_ess$yrbrn[daten_ess$yrbrn==7777 |
                  daten_ess$yrbrn==8888 |
                  daten_ess$yrbrn==9999] <- NA
daten_ess$agea[daten_ess$agea==999] <- NA
daten_ess$edulvla[daten_ess$edulvla>5] <- NA
daten_ess$eisced[daten_ess$eisced>7] <- NA
daten_ess$eduyrs[daten_ess$eduyrs>76] <- NA

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
## folgt in der naechsten Einheit


