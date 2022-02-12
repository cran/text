## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, eval = FALSE, warning=FALSE, message=FALSE------------------------
#  
#  library(text)
#  
#  # Get example data including both text and numerical variables
#  sq_data <- Language_based_assessment_data_8
#  
#  # Transform the text data to BERT word embeddings
#  wordembeddings <- textEmbed(sq_data)
#  
#  # See how word embeddings are structured
#  wordembeddings
#  
#  # Save the word embeddings to avoid having to import the text every time
#  saveRDS(wordembeddings, "wordembeddings.rds")
#  
#  # Get the word embeddings again
#  wordembeddings <- readRDS("_YOURPATH_/wordembeddings.rds")

## ---- eval = FALSE,  warning=FALSE, message=FALSE-----------------------------
#  library(text)
#  library(rio)
#  # Load data that has already gone through textEmbed
#  # The previous example only imported 10 participants;
#  # whereas below we load data from 100 participants
#  wordembeddings <- rio::import("https://r-text.org/text_data_examples/wordembeddings4_100.rda")
#  # Load corresponding numeric variables
#  numeric_data <-   rio::import("https://r-text.org/text_data_examples/Language_based_assessment_data_8_100.rda")
#  
#  # Examine the relationship between harmonytext and the corresponding rating scale
#  model_htext_hils <- textTrain(wordembeddings$harmonytexts,
#                                numeric_data$hilstotal,
#                                penalty = 1)
#  
#  # Examine the correlation between predicted and observed Harmony in life scale scores
#  model_htext_hils$correlation

## ---- eval = FALSE, warning=FALSE, message=FALSE------------------------------
#  library(text)
#  
#  # Compare the meaning between individuals' harmony in life and satisfaction with life answers
#  textSimilarityTest(word_embeddings_4$harmonytexts,
#           word_embeddings_4$satisfactiontexts,
#           Npermutations = 100,
#           output.permutations = FALSE)

## ---- eval = FALSE, warning=FALSE, message=FALSE------------------------------
#  library(text)
#  
#  # Pre-process word data to be plotted with textPlotViz-function
#  # word_embeddings_4 and Language_based_assessment_data_8  contain example data provided with the package.
#  
#  # Pre-process data
#  df_for_plotting <- textProjection(Language_based_assessment_data_8$harmonywords,
#                                  word_embeddings_4$harmonywords,
#    word_embeddings_4$singlewords_we,
#    Language_based_assessment_data_8$hilstotal, Language_based_assessment_data_8$swlstotal
#  )
#  df_for_plotting

## ---- eval = TRUE, warning=FALSE, message=FALSE, dpi=300----------------------
library(text)
# Used data (DP_projections_HILS_SWLS_100) has
# been pre-processed with the textProjection function
plot_projection <- textProjectionPlot(
  word_data = DP_projections_HILS_SWLS_100,
  k_n_words_to_test = FALSE,
  plot_n_words_square = 5,
  plot_n_words_p = 5,
  plot_n_word_extreme = 1,
  plot_n_word_frequency = 1,
  plot_n_words_middle = 1,
  y_axes = TRUE,
  p_alpha = 0.05,
  title_top = " Supervised Bicentroid Projection of Harmony in life words",
  x_axes_label = "Low vs. High HILS score",
  y_axes_label = "Low vs. High SWLS score",
  p_adjust_method = "bonferroni",
  points_without_words_size = 0.4,
  points_without_words_alpha = 0.4
)
plot_projection


