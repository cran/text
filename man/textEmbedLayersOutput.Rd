% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/1_1_textEmbed.R
\name{textEmbedLayersOutput}
\alias{textEmbedLayersOutput}
\title{Extract layers of hidden states (word embeddings) for all character variables in a given dataframe.}
\usage{
textEmbedLayersOutput(
  x,
  contexts = TRUE,
  decontexts = TRUE,
  model = "bert-base-uncased",
  layers = 11,
  return_tokens = TRUE
)
}
\arguments{
\item{x}{A character variable or a tibble/dataframe with at least one character variable.}

\item{contexts}{Provide word embeddings based on word contexts
(standard method; default = TRUE).}

\item{decontexts}{Provide word embeddings of single words as input
(embeddings used for plotting; default = TRUE).}

\item{model}{Character string specifying pre-trained language model (default 'bert-base-uncased').
 For full list of options see pretrained models at \href{https://huggingface.co/transformers/pretrained_models.html}{HuggingFace}.
 For example use "bert-base-multilingual-cased", "openai-gpt",
"gpt2", "ctrl", "transfo-xl-wt103", "xlnet-base-cased", "xlm-mlm-enfr-1024", "distilbert-base-cased",
"roberta-base", or "xlm-roberta-base".}

\item{layers}{Specify the layers that should be extracted (default 11). It is more efficient
to only extract the layers that you need (e.g., 11). You can also extract several (e.g., 11:12), or all by setting this
parameter to "all". Layer 0 is the decontextualized input layer (i.e., not comprising hidden states)
and thus should normally not be used. These layers can then be aggregated in the textEmbedLayerAggregation function.}

\item{return_tokens}{If TRUE, provide the tokens used in the specified transformer model.}
}
\value{
A tibble with tokens, column specifying layer and word embeddings. Note that layer 0 is the
input embedding to the transformer, and should normally not be used.
}
\description{
Extract layers of hidden states (word embeddings) for all character variables in a given dataframe.
}
\examples{
\donttest{
x <- Language_based_assessment_data_8[1:2, 1:2]
word_embeddings_with_layers <- textEmbedLayersOutput(x, layers = 11:12)
}
}
\seealso{
see \code{\link{textEmbedLayerAggregation}} and \code{\link{textEmbed}}
}
