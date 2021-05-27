# Encrypt data output and serve
library(gpg)
library(tidyverse)

# -------------------------------------------------------------------------------------------------
# Once only set-up
gpg_import("Ewen Harrison_0xBD44FC80_public.asc")
gpg_recv(search = "rptevans@doctors.org.uk")
gpg_recv(search = "ewen harrison")
gpg_recv(search = "annemarie docherty")

## Check
gpg_list_keys()

# -------------------------------------------------------------------------------------------------
# Set public keys
them_id = "C64132A24779EC41"
me_id = "0D930D65BD44FC80"

here::here(safe_path, file_name_rds) %>% 
  gpg_encrypt(receiver = c(them_id, me_id)) %>% 
  writeLines(here::here(export_path, paste0(file_name_rds, ".gpg")))

here::here(safe_path, file_name_csv) %>% 
  gpg_encrypt(receiver = c(them_id, me_id)) %>% 
  writeLines(here::here(export_path, paste0(file_name_csv, ".gpg")))

# --------------------------------------------------------------------------------------------------
# Go to render_site.Rmd and push to argoshare.  
