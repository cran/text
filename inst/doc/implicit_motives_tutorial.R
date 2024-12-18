## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
evaluate = FALSE

## ----eval = evaluate, warning=FALSE, message=FALSE, dpi=300-------------------
#  #### Initial setup: Install and open the text package in an R environment (only required the first time).
#  #install.packages("text")
#  #textrpp_install()
#  #textrpp_initialize()
#  
#  #### Load the package.
#  library(text)
#  
#  #### 1: Load data. The following data serves as an example:
#  data <- dplyr::mutate(.data = Language_based_assessment_data_8, participant_id = dplyr::row_number())
#  
#  #### 2: Retrieve sentence- and person-level predictions. Choose between our three motives: power, achievement, or affiliation.
#  predictions <- textPredict(
#    texts = data$satisfactiontexts,
#    model_info = "implicitpower_roberta23_nilsson2024",
#    participant_id = data$participant_id,
#    dataset_to_merge_predictions = data)
#  
#  #### 3: Examine sentence- and person-level predictions.
#  predictions$sentence_predictions
#  predictions$person_predictions
#  predictions$dataset
#  
#  
#  

