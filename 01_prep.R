# Prep file for export
# Ensufre no identifiers accidentally go.

library(finalfit)
library(tidyverse)

# -------------------------------------------------------------------------------------------------
# Make export object with desired file name
colon_s_export = colon_s %>% 
  select(-id)

# 929 rows
# 31 variables. 

# -------------------------------------------------------------------------------------------------
# Define paths and file names
# Usually only thing to change is this:
file_name = "colon_s_export"

# -------------------------------------------------------------------------------------------------
# Usually don't change below here
safe_path = "safe"
export_path = "export"
file_name_rds = paste0(file_name, ".rds")
file_name_csv = paste0(file_name, ".csv")

# -------------------------------------------------------------------------------------------------
# Save
system(paste("mkdir", safe_path))
system(paste("mkdir", export_path))
saveRDS(get(file_name), here::here(safe_path, file_name_rds))
write_csv(get(file_name), here::here(safe_path, file_name_csv))
