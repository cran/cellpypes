% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pseudobulk.R
\name{pseudobulk}
\alias{pseudobulk}
\title{Form pseudobulks from single cells.}
\usage{
pseudobulk(raw, pseudobulk_id)
}
\arguments{
\item{raw}{A matrix with raw UMI counts, cells in columns.}

\item{pseudobulk_id}{A factor that identifies which cells should go to
which pseudobulk. Generate pseudobulk_ids with the \link[cellpypes]{pseudobulk_id} function!}
}
\value{
A matrix where each column is a pseudobulk and each row a gene.
}
\description{
Sum up cells in count matrix \code{raw} for bulk RNA methods such as
DESeq2.
}
\examples{
# Create pseudobulk counts and coldata for DESeq2: 
coldata <- data.frame(
  celltype = rep(c("X+Y-", "X+Y+", "X-Y+", "X-Y-"),
                 each = nrow(simulated_umis$embed)/4), # 4 cell types
  patient  = c("3", "500.", "*5", "/")
)
coldata$pseudobulk_id <- pseudobulk_id(coldata)
counts <- pseudobulk(simulated_umis$raw, coldata$pseudobulk_id)
# Use counts/coldata as input for DESeqDataSetFromMatrix (DESeq2).

}
