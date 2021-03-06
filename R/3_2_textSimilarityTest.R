
#' Test whether there is a significant difference in meaning between two sets of texts
#' (i.e., between their word embeddings).
#' @param x Set of word embeddings from textEmbed.
#' @param y Set of word embeddings from textEmbed.
#' @param Npermutations Number of permutations (default 1000).
#' @param method Compute a "paired" or an "unpaired" test.
#' @param alternative Use a two or one-sided test (select one of: "two_sided", "less", "greater").
#' @param output.permutations If TRUE, returns permuted values in output.
#' @param N_cluster_nodes Number of cluster nodes to use (more makes computation faster; see parallel package).
#' @param seed Set different seed.
#' @return A list with a p-value, cosine_estimate and permuted values if output.permutations=TRUE.
#' @examples
#' x <- wordembeddings4$harmonywords
#' y <- wordembeddings4$satisfactionwords
#' textSimilarityTest(x,
#'   y,
#'   method = "paired",
#'   Npermutations = 10,
#'   N_cluster_nodes = 1,
#'   alternative = "two_sided"
#' )
#' @importFrom dplyr select starts_with
#' @importFrom parallel splitIndices mclapply
#' @export
textSimilarityTest <- function(x,
                               y,
                               Npermutations = 10000,
                               method = "paired",
                               alternative = c("two_sided", "less", "greater"),
                               output.permutations = TRUE,
                               N_cluster_nodes = 1,
                               seed = 1001) {
  T1_textSimilarityTest <- Sys.time()

  set.seed(seed)
  if ((nrow(x) != nrow(y))) {
    stop("x and y must have the same number of rows for a paired textSimilarityTest test.")
  }
  alternative <- match.arg(alternative)
  results <- c("cosine_estimate" = NA, "p.value" = NA)

  # Select variables beginning with V
  x1 <- dplyr::select(x, dplyr::starts_with("Dim"))
  y1 <- dplyr::select(y, dplyr::starts_with("Dim"))

  if (method == "paired") {
    # Compute cosine between all pairs
    cosine_observed <- cosines(x1, y1)
    # Compute the data's mean of the cosine
    results["cosine_estimate"] <- mean(abs(cosine_observed))
  }

  if (method == "unpaired") {
    X_all <- textEmbeddingAggregation(x1, aggregation = "mean")
    Y_all <- textEmbeddingAggregation(y1, aggregation = "mean")
    # Compute cosine between the summed word embedding

    # This is to make it work with the cosines function that require several word embeddings
    X_all <- rbind(X_all, X_all)
    Y_all <- rbind(Y_all, Y_all)

    cosine_observed <- cosines(X_all, Y_all)

    # Compute the data's mean of the cosine
    results["cosine_estimate"] <- mean(abs(cosine_observed))
  }

  ### Compute comparison distribution of cosine based on randomly drawn word embeddings from both groups
  # adding groups together.
  x1y1 <- rbind(x1, y1)

  # Setting up parallel processing (Npermutations=100 Nthread = 2),
  splitix <- parallel::splitIndices(nx = Npermutations, ncl = N_cluster_nodes)
  splitix <- splitix[sapply(splitix, length) > 0]

  distribution_mean_cosine_permutated <- parallel::mclapply(splitix, function(x, xx, yy) {
    mean_cosine_permutated <- sapply(x, function(x, xx, yy) {
      # Get indixes for how to randomly split the word embeddings.
      indices <- sample(c((rep(TRUE, nrow(x1y1) / 2)), (rep(FALSE, nrow(x1y1) / 2))), nrow(x1y1), replace = FALSE)
      # Randomly select word embeddings into two different data frames.
      rdata1 <- x1y1[indices, ]
      rdata2 <- x1y1[!indices, ]
      # Compute the cosine between randomly drawn word embeddings and compute the mean.
      if (method == "paired") {
        rcosines <- cosines(rdata1, rdata2)
        return(mean(abs(rcosines)))
      }
      if (method == "unpaired") {
        R1_all <- textEmbeddingAggregation(rdata1, aggregation = "mean")
        R2_all <- textEmbeddingAggregation(rdata2, aggregation = "mean")
        # Compute cosine between the summed word embedding

        # This is to make it work with the cosines function that require several word embeddings
        R1_all <- rbind(R1_all, R1_all)
        R2_all <- rbind(R2_all, R2_all)
        rcosines <- cosines(R1_all, R2_all)

        # Compute the data's mean of the cosine
        return(abs(rcosines))
      }
    }, xx = xx, yy = yy)
    return(mean_cosine_permutated)
  }, xx = x, yy = y)
  NULLresults <- unlist(distribution_mean_cosine_permutated)

  # Examine how the ordered data's mean of the cosine compare with the random data's, null comparison distribution
  p_value <- p_value_comparing_with_Null(NULLresults, Observedresults = results["cosine_estimate"], Npermutations = Npermutations, alternative = alternative)
  results["p.value"] <- p_value
  results <- as.list(results)

  if (output.permutations) {
    random.estimates.4.null <- list(NULLresults)
    names(random.estimates.4.null) <- "random.estimates.4.null"
  } else {
    random.estimates.4.null <- NULL
  }

  x_name <- deparse(substitute(x))
  y_name <- deparse(substitute(y))
  embedding_descriptions_x <- paste(x_name, ":", comment(x), col = "")
  embedding_descriptions_y <- paste(y_name, ":", comment(y), col = "")

  # Time
  T2_textSimilarityTest <- Sys.time()
  Time_textSimilarityTest <- T2_textSimilarityTest - T1_textSimilarityTest
  Time_textSimilarityTest <- sprintf("Duration to run the test: %f %s", Time_textSimilarityTest, units(Time_textSimilarityTest))
  Date_textSimilarityTest <- Sys.time()
  time_date <- paste(Time_textSimilarityTest,
    "; Date created: ", Date_textSimilarityTest,
    sep = "",
    collapse = " "
  )

  test_description <- paste("permutations = ", Npermutations,
    "method = ", method,
    "alternative = ", alternative,
    collapse = " "
  )

  descriptions <- c(
    embedding_descriptions_x,
    embedding_descriptions_y,
    test_description,
    time_date
  )
  names(descriptions) <- c("embedding_x", "embedding_y", "test_description", "time_date")

  results <- c(
    random.estimates.4.null,
    descriptions,
    results
  )

  results
}
