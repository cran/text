## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----extended_installation, eval = FALSE--------------------------------------
#  library(text)
#  
#  # To install the python packages torch, transformers, numpy and nltk through R, run:
#  library(reticulate)
#  install_miniconda()
#  
#  conda_install(envname = 'r-reticulate', c('torch==0.4.1', 'transformers==3.3.1', 'numpy', 'nltk'), pip = TRUE)
#  
#  # Windows 10
#  conda_install(envname = 'r-reticulate', c('torch==0.4.1', 'transformers==3.3.1', 'numpy', 'nltk'))
#  

## ----extended_installation_checking_system, eval = FALSE----------------------
#  
#  # First check R-version and which packages that are attached and loaded.
#  sessionInfo()
#  
#  # Second check out python version; and make sure you at least have version 3.6.10
#  library(reticulate)
#  py_config()

## ----extended_REinstallation, eval = FALSE------------------------------------
#  library(text)
#  
#  # To re-install packages start with a fresh session by restarting R and RStudio
#  
#  # Install development of reticulate (might not be necessary)
#  devtools::install_github("rstudio/reticulate")
#  
#  # After having manually removed the r-miniconda folder, install it again:
#  library(reticulate)
#  install_miniconda()
#  
#  # Subsequently re-install torch, transformers, numpy and nltk by running:
#  conda_install(envname = 'r-reticulate', c('torch==0.4.1', 'transformers==3.3.1', 'numpy', 'nltk'), pip = TRUE)
#  

