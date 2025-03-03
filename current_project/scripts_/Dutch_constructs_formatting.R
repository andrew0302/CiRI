## -------------------------------------------------------------------------------------------------------------
library('here')
library('dplyr')
library('knitr')


## -------------------------------------------------------------------------------------------------------------
#define data folder
data_folder <- here("data_")

list.files(here(data_folder))

T0_df <- read.csv(here(data_folder, "CWM T0 - PPO 2022 - Export 20241121 - R=60.csv"))

questions <- colnames(T0_df) %>% as.data.frame()

rm(data_file_path, data_files, file_name)


## -------------------------------------------------------------------------------------------------------------
#colnames(T0_df[,35:51])

##Entrepreneurial Intentions:
intentions_colnames <- c(paste0("Intention_000", seq(1,9)))
intentions_vars <-  c(
  "In.de.komende.12.maanden.wil.ik.praktische.experimenten.doen.om.oplossingen.te.bedenken.voor.mijn.klanten.en.opdrachtgevers...",
  "In.de.komende.12.maanden.ben.ik.van.plan.om.een.prototype.te.ontwikkelen.voor.een.product.of.dienst...",
  "In.de.komende.12.maanden.ben.ik.van.plan.om.een.waardepropositie.te.ontwikkelen...",
  "In.de.komende.12.maanden.ben.ik.van.plan.om.mijn.waardepropositie.te.testen.in.de.markt...",
  "In.de.komende.12.maanden.ben.ik.van.plan.om.te.stoppen.met.mijn..bij.baan.of.veel.minder.tijd.aan.mijn..bij.baan.te.spenderen..zodat.ik.me.kan.focussen.op.mijn.onderneming...",
  "In.de.komende.12.maanden.ben.ik.van.plan.om.mijn.eigen.geld.in.mijn.onderneming.te.investeren...",
  "In.de.komende.12.maanden.ben.ik.van.plan.om.een..extra..zakelijke.bankrekening.te.openen.....",
  "In.de.komende.12.maanden.ben.ik.van.plan.om.dure.apparatuur.aan.te.schaffen.voor.mijn.onderneming.....",
  "In.de.komende.12.maanden.ben.ik.van.plan.om.te.zoeken.naar.financiering.voor.mijn.plannen......")


##Entrepreneurial Skills:
Entrskills_colnames <- c("Entrskills_0001", "Entrskills_0002", "Entrskills_0003", "Entrskills_0004", "Entrskills_0005", "Entrskills_0006", "Entrskills_0007")
Entrskills_vars <- c(
  "Ik.herken.altijd.kansen",
  "Ik.ben.creatief",
  "Ik.kan.goed.problemen.oplossen",
  "Ik.ben.een.goede.leider",
  "Het.is.makkelijk.om.met.anderen.te.communiceren", 
  "Ik.heb.altijd.nieuwe.ideeën",
  "Ik.maak.makkelijk.contact")

##Personal Skills: 35-51
perskills_colnames <- c(paste0("Perskills_000", seq(01,09)), paste0("Perskills_00", seq(10,17)))
perskills_vars <- c(
   "Ik.heb.zelfvertrouwen",
   "Ik.heb.analytisch.vermogen",
   "Ik.ben.optimistisch",
   "Ik.hou.van.authenticiteit..bij.jezelf.blijven.",
   "Ik.ben.doelgericht",
   "Ik.ben.daadkrachtig",
   "Ik.ben.nieuwsgierig",
   "Ik.heb.discipline",
   "Ik.heb.sociaal.adaptatievermogen",
   "Ik.ben.communicatief",
   "Ik.ben.efficiënt",
   "Ik.heb.verantwoordelijkheidsgevoel",
   "Ik.heb.doorzettingsvermogen",
   "Ik.heb.zelfkennis",
   "Ik.heb.empatisch.vermogen", 
   "Ik.ben.goed.in.leiderschap",
   "Ik.ben.stressbestendig"
)

##Need for Achievement: 52-55
NFA_colnames <- c("NfA_0001","NfA_0002","NfA_0003","NfA_0004")
NFA_vars <- c(
  "Ik.doe.altijd.goed.mijn.best..ook.wanneer.het.moeilijk.is",
  "Ik.stop.veel.energie.in.het.verbeteren.van.mijn..werk.resultaten",
  "Ik.probeer.altijd.extra.verantwoordelijkheden.te.nemen",
  "Ik.probeer.betere.resultaten.te.halen.dan.mijn.vakgenoten"
)

#Locus of Control: 56-61
LoC_colnames <- c('LoC_0001','LoC_0002','LoC_0003','LoC_0004','LoC_0005','LoC_0006')
LoC_vars <-c(
  "Als.ik.plannen.maak.weet.ik.zeker.dat.ze.werken",
  "Als.ik.iets.goed.doe..komt.dat.door.mijn.vaardigheden.en.niet.door.geluk",
  "Wat.mij.overkomt.komt.door.mijn.eigen.gedrag",
  "Veel.ongelukkige.gebeurtenissen.in.het.leven.van.een.persoon.komen.door.pech.",
  "Een.goede..creatieve..business.hebben.komt.voornamelijk.door.op.het.juiste.moment.op.de.juiste.plek.te.zijn",
  "Soms.heb.ik.het.idee.dat.ik.niet.genoeg.controle.heb.over.mijn.leven"
)

#Tolerance for Ambiguity: 62-65
TfA_colnames <- c('TfA_0001','TfA_0002','TfA_0003','TfA_0004')
TfA_vars <- c(
  "Niets.is.interessanter.dan.leven.onder.steeds.veranderende.omstandigheden",
  "Innovatieve.mensen.en.mensen.die.risico.s.nemen.bereiken.meer.in.het.leven.dan.geordende.mensen",
  "Als.je.echt.wilt.genieten.van.je.vakantie..moet.je.deze.goed.plannen",
  "Hetzelfde.doen.op.dezelfde.plek.voor.een.lange.periode.leidt.tot.een.gelukkig.leven"
)


## -------------------------------------------------------------------------------------------------------------
#assemble df
intentions_df <- T0_df %>% select(X., intentions_vars)
colnames(intentions_df) <- c("Accountnummer", intentions_colnames)

Entrskills_df <- T0_df %>% select(X., Entrskills_vars)
colnames(Entrskills_df) <- c("Accountnummer", Entrskills_colnames)

perskills_df <- T0_df %>% select(X., perskills_vars)
colnames(perskills_df) <- c("Accountnummer", perskills_colnames)

NFA_df <- T0_df %>% select(X., NFA_vars)
colnames(NFA_df) <- c("Accountnummer", NFA_colnames)

LoC_df <- T0_df %>% select(X., LoC_vars)
colnames(LoC_df) <- c("Accountnummer", LoC_colnames)

TfA_df <- T0_df %>% select(X., TfA_vars)
colnames(TfA_df) <- c("Accountnummer", TfA_colnames)

T0_constructs_df <- merge(LoC_df, TfA_df, by="Accountnummer")
T0_constructs_df <- merge(NFA_df, T0_constructs_df, by = "Accountnummer")
T0_constructs_df <- merge(perskills_df, T0_constructs_df, by = "Accountnummer")
T0_constructs_df <- merge(Entrskills_df, T0_constructs_df, by = "Accountnummer")
T0_constructs_df <- merge(intentions_df, T0_constructs_df, by = "Accountnummer")
T0_constructs_df <- T0_constructs_df %>% select(Accountnummer, everything())

Entrskills_vars <- Entrskills_colnames
LoC_vars <- LoC_colnames
TfA_vars <- TfA_colnames
perskills_vars  <- perskills_colnames
NFA_vars <- NFA_colnames
intentions_vars <- intentions_colnames

constructs <- list(Entrskills_vars, perskills_vars, NFA_vars, LoC_vars, TfA_vars)
names(constructs) <- c("Entrskills_vars", "perskills_vars", "NFA_vars", "LoC_vars", "TfA_vars")


rm(
  questions,
  Entrskills_colnames, Entrskills_df,
  LoC_colnames, LoC_df,
  TfA_colnames, TfA_df,
  perskills_colnames, perskills_df, 
  NFA_colnames, NFA_df,
  intentions_colnames, intentions_df)


## -------------------------------------------------------------------------------------------------------------
T0_constructs_df <- data.frame(lapply(T0_constructs_df, function(x) {
                  gsub("Helemaal niet mee eens", as.numeric(0), x)
              }))

T0_constructs_df <- data.frame(lapply(T0_constructs_df, function(x) {
                  gsub("Niet mee eens", as.numeric(1), x)
              }))

T0_constructs_df <- data.frame(lapply(T0_constructs_df, function(x) {
                  gsub("Neutraal", as.numeric(2), x)
              }))

T0_constructs_df <- data.frame(lapply(T0_constructs_df, function(x) {
                  gsub("Mee eens", as.numeric(3), x)
              }))

T0_constructs_df <- data.frame(lapply(T0_constructs_df, function(x) {
                  gsub("Helemaal mee eens", as.numeric(4), x)
              }))

T0_constructs_df <- T0_constructs_df %>% mutate_all(na_if,"")

#workaround: despite indicating 'as.numeric()' above, it still creates a character vector
Accountnummer <- T0_constructs_df$Accountnummer
temp_df <- T0_constructs_df %>% select(-Accountnummer)
temp_df <-lapply(temp_df, as.numeric) %>% as.data.frame()
temp_df$Accountnummer <- Accountnummer
T0_constructs_df <- temp_df %>% select(Accountnummer, everything())

#reverse scoring
T0_constructs_df$TfA_0003 <- T0_constructs_df$TfA_0003 * -1
T0_constructs_df$TfA_0004 <- T0_constructs_df$TfA_0004 * -1

T0_constructs_df$LoC_0004 <- T0_constructs_df$LoC_0004 * -1
T0_constructs_df$LoC_0005 <- T0_constructs_df$LoC_0005 * -1
T0_constructs_df$LoC_0006 <- T0_constructs_df$LoC_0006 * -1

#scale_terms <- c("Helemaal niet mee eens", "Niet mee eens", "Neutraal", "Mee eens", "Heel erg mee eens")
#scale_numbers <- c("0","1", "2", "3", "4")

rm(temp_df)


## -------------------------------------------------------------------------------------------------------------
#purl(here("PPO", "PPO_constructs_fomatting_1.1.Rmd"), output=(here("PPO", "PPO_constructs_formatting_1.1.R")))

