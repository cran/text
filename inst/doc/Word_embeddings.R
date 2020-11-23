## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----HuggingFface_tabble_long, echo=FALSE, results='asis'---------------------
library(magrittr)
Models <- c("'bert-base-uncased'",
            "'roberta-base'",
            "'distilbert-base-cased'",
            "'bert-base-multilingual-cased'",
            "'xlm-roberta-large'"
            )

References <- c("[Devlin et al. 2019](https://www.aclweb.org/anthology/N19-1423/)",
                "[Liu et al. 2019](https://arxiv.org/abs/1907.11692)",
                "[Sahn et al., 2019](https://arxiv.org/abs/1910.01108)",
                "[Devlin et al.2019](https://www.aclweb.org/anthology/N19-1423/)",
                "[Liu et al](https://arxiv.org/pdf/1907.11692.pdf)"
                )

Layers <- c("12",
            "12", 
            "6?",
            "12",
            "24")

Language <- c("English",
              "English", 
              "English",
              "[104 top languages at Wikipedia](https://meta.wikimedia.org/wiki/List_of_Wikipedias)",
              "[100 language](https://huggingface.co/transformers/multilingual.html)")

Dimensions <- c("768", 
                "768", 
                "768?", 
                "768", 
                "1024")

Tables_short <- tibble::tibble(Models, References, Layers, Dimensions, Language)

knitr::kable(Tables_short, caption="", bootstrap_options = c("hover"), full_width = T)

## ----word_embedding_tutorial_b1, eval = FALSE, warning=FALSE, message=FALSE----
#  library(text)
#  
#  # Transform the text data to BERT word embeddings
#  wordembeddings <- textEmbed(x = Language_based_assessment_data_8,
#                              model = 'bert-base-uncased',
#                              contexts = TRUE,
#                              layers = 11:12,
#                              context_aggregation = "mean",
#                              decontexts = TRUE,
#                              decontext_layers = 11:12,
#                              decontext_aggregation = "mean")
#  
#  # Save the word embeddings to avoid having to import the text every time
#  # saveRDS(wordembeddings, "_YOURPATH_/wordembeddings.rds")
#  # Get the word embeddings again
#  # wordembeddings <- readRDS("_YOURPATH_/wordembeddings.rds")
#  
#  # See how word embeddings are structured
#  wordembeddings

## ----word_embedding_tutorial_b2, eval = FALSE, warning=FALSE, message=FALSE----
#  library(text)
#  
#  #Transform the text data to BERT word embeddings
#  
#  x <- Language_based_assessment_data_8[1:2, 1:2]
#  
#  wordembeddings_tokens_layers <- textEmbedLayersOutput(x,
#                                                  contexts = TRUE,
#                                                  decontexts = FALSE,
#                                                  model = 'bert-base-uncased',
#                                                  layers = 'all',
#                                                  return_tokens = TRUE)
#  wordembeddings_tokens_layers

## ----word_embedding_tutorial_b3, eval = FALSE, warning=FALSE, message=FALSE----
#  library(text)
#  
#  # Aggregating layer 11 and 12 by taking the mean of each dimension.
#  we_11_12_mean <- textEmbedLayerAggreation(word_embeddings_layers = wordembeddings_tokens_layers,
#                                        layers = 11:12,
#                                        aggregation = "mean")
#  
#  # Aggregating layer 11 and 12 by taking the minimum of each dimension accross the two layers.
#  we_11_12_min <- textEmbedLayerAggreation(word_embeddings_layers = wordembeddings_tokens_layers,
#                                       layers = 11:12,
#                                       aggregation = "min")
#  
#  # Aggregating layer 1 to 12 by taking the max value of each dimension accross the 12 layers.
#  we_1_12_min <- textEmbedLayerAggreation(word_embeddings_layers = wordembeddings_tokens_layers,
#                                      layers = 1:12,
#                                      aggregation = "max")
#  we_1_12_min

