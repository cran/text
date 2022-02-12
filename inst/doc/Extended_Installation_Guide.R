## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----extended_installation_condaenv, eval = FALSE-----------------------------
#  library(text)
#  library(reticulate)
#  
#  # Install text required python packages in a conda environment (with defaults).
#  text::textrpp_install()
#  
#  # Show available conda environments.
#  reticulate::conda_list()
#  
#  # Initialize the installed conda environment.
#  # save_profile = TRUE saves the settings so that you don't have to run textrpp_initialize() after restarting R.
#  text::textrpp_initialize(save_profile = TRUE)
#  
#  # Test so that the text package work.
#  textEmbed("hello")
#  

## ----conda_tabble_short, echo=FALSE, results='asis'---------------------------
library(magrittr)

os <- c("'Windows'", 
        "'Mac OS'", "'Linux'", "'Windows'",
        "'Mac OS'", "'Linux'",  "'Windows'",
        "'Mac OS'", "'Linux'", "'Windows'")
mini_conda <- c("'4.10.1'", 
                "'4.10.3'", "'4.10.3'", "'4.10.3'",
                "'4.10.3'", "'4.10.3'", "'4.10.3'",
                "'4.10.3'", "'4.10.3'", "'4.10.3'")
pyhon <- c("'3.9.0'",
                   "'3.9.0'", "'3.9.0'", "'3.9.0'",
                   "'3.8.10'", "'3.8.10'", "'3.8.10'",
                   "'3.7.0'", "'3.7.0'", "'3.6.13'"
                )

torch <- c("'torch==1.7.1'", 
           "'torch==1.7.1'", "'torch==1.7.1'", "'torch==1.7.1'", 
           "'torch==1.7.1'", "'torch==1.7.1'", "'torch==1.7.1'", 
           "'torch==0.4.1'", "'torch==0.4.1'", "'torch==1.10'")

transformers <- c("'transformers==4.12.5'", 
                  "'transformers==4.12.5'", "'transformers==4.12.5'", "'transformers==4.12.5'",
                  "'transformers==4.12.5'", "'transformers==4.12.5'", "'transformers==4.12.5'", 
                  "'transformers==3.3.1'", "'transformers==3.3.1'", "'transformers==3.3.1'")

success <- c("FAIL", 
             "Pass", "Pass","Pass",
             "Pass","Pass","Pass",
             "Pass","Pass","Pass")

mini_conda_table <- tibble::tibble(os, mini_conda, pyhon, torch, transformers, success)

knitr::kable(mini_conda_table, caption="", bootstrap_options = c("hover"), full_width = T)

## ----extended_installation_venv, eval = FALSE---------------------------------
#  # Create a virtual environment with text required python packages.
#  # Note that you have to provide a python path.
#  text::textrpp_install_virtualenv(rpp_version = c("torch==1.7.1", "transformers==4.12.5", "numpy", "nltk"),
#                                   python_path = "/usr/local/bin/python3.9",
#                                   envname = "textrpp_virtualenv")
#  
#  # Initialize the virtual environment.
#  text::textrpp_initialize(virtualenv = "textrpp_virtualenv",
#                           condaenv = NULL,
#                           save_profile = TRUE)
#  

## ----venv_tabble_short, echo=FALSE, results='asis'----------------------------
library(magrittr)

OS <- c("'Mac OS'", "'Linux'", "'Windows'")

Pyhon_version <- c("'3.9.8'", "-", "-")

torch <- c("'torch==1.7.1'", "-", "-")

transformers <- c("'transformers==4.12.5'", "-", "-")

Success <- c("Pass", "-", "-")

venv_conda_table <- tibble::tibble(OS, Pyhon_version, torch, transformers, Success)

knitr::kable(venv_conda_table, caption="", bootstrap_options = c("hover"), full_width = T)

## ----extended_installation_old, eval = FALSE----------------------------------
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

