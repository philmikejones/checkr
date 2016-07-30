data <- "lcf_2010_teaching_dataset_dvhh_final_july_v2.sav"
lcfs <- haven::read_sav(
  paste0("inst/extdata/UKDA-7216-spss/spss/spss14/", data))
rm(data)

colnames(lcfs) <- c(
  "id", "weight", "expenditure", "income", "income_source", "internet",
  "econ_act_hrp", "NSSEC3_hrp", "tenure", "sex_hrp", "persons", "adults",
  "children", "region"
)

lcfs[["income_source"]] <- factor(lcfs[["income_source"]],
                                  levels = 1:2,
                                  labels = c("earned", "other"))
lcfs[["internet"]]      <- factor(lcfs[["internet"]],
                                  levels = c(1:2),
                                  labels = c("internet", "no_internet"))
lcfs[["econ_act_hrp"]]  <- factor(lcfs[["econ_act_hrp"]],
                                  levels = 1:4,
                                  labels = c("ft", "pt", "unemp_or_training",
                                             "econ_inactive"))
lcfs[["NSSEC3_hrp"]]    <- factor(lcfs[["NSSEC3_hrp"]],
                                  levels = 1:5,
                                  labels = c("professional", "intermediate",
                                             "routine_manual", "lt_unemp",
                                             "not_classified"),
                                  ordered = TRUE)
lcfs[["tenure"]]        <- factor(lcfs[["tenure"]],
                                  levels = 1:3,
                                  labels = c("public_rent", "private_rent",
                                             "owned"))
lcfs[["sex_hrp"]]       <- factor(lcfs[["sex_hrp"]],
                                  levels = 1:2,
                                  labels = c("male", "female"))
lcfs[["persons"]]       <- factor(lcfs[["persons"]],
                                  levels = 1:5,
                                  labels = c("1", "2", "3", "4", "5_or_more"),
                                  ordered = TRUE)
lcfs[["adults"]]        <- factor(lcfs[["adults"]],
                                  levels = 1:4,
                                  labels = c("1", "2", "3", "4_or_more"),
                                  ordered = TRUE)
lcfs[["children"]]      <- factor(lcfs[["children"]],
                                  levels = 1:3,
                                  labels = c("0", "1", "2_or_more"),
                                  ordered = TRUE)
lcfs[["region"]]        <- factor(lcfs[["region"]],
                                  levels = 1:12,
                                  labels = c("ne", "nw", "yh", "em", "wm",
                                             "ee", "ln", "se", "sw", "ws",
                                             "sc", "ni"))

save(lcfs, file = "data/lcfs.RData")
