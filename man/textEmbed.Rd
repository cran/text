% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/1_1_textEmbed.R
\name{textEmbed}
\alias{textEmbed}
\title{Extract layers and aggregate them to word embeddings, for all character variables in a given dataframe.}
\usage{
textEmbed(
  x,
  model = "bert-base-uncased",
  layers = 11:12,
  contexts = TRUE,
  context_layers = layers,
  context_aggregation_layers = "concatenate",
  context_aggregation_tokens = "mean",
  context_tokens_select = NULL,
  context_tokens_deselect = NULL,
  decontexts = TRUE,
  decontext_layers = layers,
  decontext_aggregation_layers = "concatenate",
  decontext_aggregation_tokens = "mean",
  decontext_tokens_select = NULL,
  decontext_tokens_deselect = NULL
)
}
\arguments{
\item{x}{A character variable or a tibble/dataframe with at least one character variable.}

\item{model}{Character string specifying pre-trained language model (default 'bert-base-uncased').
 For full list of options see pretrained models at \href{https://huggingface.co/transformers/pretrained_models.html}{HuggingFace}.
 For example use "bert-base-multilingual-cased", "openai-gpt",
"gpt2", "ctrl", "transfo-xl-wt103", "xlnet-base-cased", "xlm-mlm-enfr-1024", "distilbert-base-cased",
"roberta-base", or "xlm-roberta-base".}

\item{layers}{Specify the layers that should be extracted (default 11:12). It is more efficient to
only extract the layers that you need (e.g., 12).
Layer 0 is the decontextualized input layer (i.e., not comprising hidden states) and thus advised to not use.
These layers can then be aggregated in the textEmbedLayerAggregation function. If you want all layers then use 'all'.}

\item{contexts}{Provide word embeddings based on word contexts
(standard method; default = TRUE).}

\item{context_layers}{Specify the layers that should be aggregated (default the number of layers extracted above).
Layer 0 is the decontextualized input layer (i.e., not comprising hidden states) and thus advised not to be used.}

\item{context_aggregation_layers}{Method to aggregate the contextualized layers (e.g., "mean", "min" or "max, which takes the
minimum, maximum or mean, respectively, across each column; or "concatenate", which links together each word embedding layer
to one long row.}

\item{context_aggregation_tokens}{Method to aggregate the contextualized tokens (e.g., "mean", "min" or "max, which takes the
minimum, maximum or mean, respectively, across each column; or "concatenate", which links together each word embedding layer
to one long row.}

\item{context_tokens_select}{Option to select word embeddings linked to specific tokens
such as [CLS] and [SEP] for the context embeddings.}

\item{context_tokens_deselect}{Option to deselect embeddings linked to specific tokens
such as [CLS] and [SEP] for the context embeddings.}

\item{decontexts}{Provide word embeddings of single words as input
(embeddings, e.g., used for plotting; default = TRUE).}

\item{decontext_layers}{Layers to aggregate for the decontext embeddings  the number of layers extracted above.}

\item{decontext_aggregation_layers}{Method to aggregate the decontextualized layers (e.g., "mean", "min" or "max, which takes the
minimum, maximum or mean, respectively, across each column; or "concatenate", which links together each word embedding layer
to one long row.}

\item{decontext_aggregation_tokens}{Method to aggregate the decontextualized tokens (e.g., "mean", "min" or "max, which takes the
minimum, maximum or mean, respectively, across each column; or "concatenate", which links together each word embedding layer
to one long row.}

\item{decontext_tokens_select}{Option to select embeddings linked to specific tokens
such as [CLS] and [SEP] for the decontext embeddings.}

\item{decontext_tokens_deselect}{option to deselect embeddings linked to specific tokens
such as [CLS] and [SEP] for the decontext embeddings.}
}
\value{
A tibble with tokens, a column for layer identifier and word embeddings.
Note that layer 0 is the input embedding to the transformer
}
\description{
Extract layers and aggregate them to word embeddings, for all character variables in a given dataframe.
}
\examples{
\donttest{
x <- Language_based_assessment_data_8[1:2, 1:2]
# Example 1
wordembeddings <- textEmbed(x, layers = 9:11, context_layers = 11, decontext_layers = 9)
# Show information that have been saved with the embeddings about how they were constructed
comment(wordembeddings$satisfactionwords)
comment(wordembeddings$singlewords_we)
comment(wordembeddings)
# Example 2
wordembeddings <- textEmbed(x, layers = "all", context_layers = "all", decontext_layers = "all")
}
}
\seealso{
see \code{\link{textEmbedLayerAggregation}} and \code{\link{textEmbedLayersOutput}}
}