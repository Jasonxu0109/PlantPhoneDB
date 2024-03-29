% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LRscore.r
\name{LRscore}
\alias{LRscore}
\title{Score ligand-receptor interactions}
\usage{
LRscore(
  expr,
  LRdb,
  cluster = NULL,
  min.pct = 0.1,
  method = "LRscore",
  iterations = 100,
  seed = 123,
  ...
)
}
\arguments{
\item{expr}{A data frame or matrix of n rows (genes) and m columns (cells) normalized by SCTransform().}

\item{LRdb}{A dataset with ligand-receptor pairs, such as LR_pair_ath.RDa.}

\item{cluster}{A numeric vector of length m.}

\item{min.pct}{Only test genes that are detected in a minimum fraction of min.pct cells in either of the two populations. Default is 0.1.}

\item{method}{Denotes which test to use. Available options are:
\itemize{
 \item{"LRscore"} : Score ligand-receptor interactions using a new regularized product score (Cabello-Aguilar et al., Nucleic Acids Research, 2020).
 \item{"WeightProduct"} : Score ligand-receptor interactions using an edge-score model (Altmann et al., Nature, 2020)
 \item{"Average"} : Score ligand-receptor interactions using
 mean ligand expression level + mean receptor expression level (Efremova et al., Nature Protocols, 2020).
 \item{"Product"} : Score ligand-receptor interactions using
 mean ligand expression level × mean receptor expression level.
}}

\item{iterations}{Ligand-receptor interactions scores were calculated using a permutation
test by randomly shuffling the cluster labels if method set Average or Product.
Default is 100.}

\item{seed}{Random seed. Default is 123.}

\item{...}{}
}
\value{
A data frame of the ligand-receptor interactions.
}
\description{
Score ligand-receptor interactions
}
