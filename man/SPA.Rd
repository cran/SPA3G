\name{SPA}
\alias{SPA}

\title{

run SPA
}
\description{
SPA function for testing overall genetic effect and ineraction effect of a pair of genes.
}
\usage{
SPA(Y, G, g.size, cutoff = 0.05, par = NULL, est.alt = FALSE)
}

\arguments{
  \item{Y}{

numerical vector: phenotype values.
}
  \item{G}{

matrix: genotypes of the gene pair, where columns are SNP markers and rows are samples.
}
  \item{g.size}{

numerical vector: with two elements indicating number of SNP markers in each gene of the gene pair.
}
  \item{cutoff}{

numerical value: cutoff for the overall test pvalue indicating when to perform interaction test.
}
  \item{par}{

numerical vector: initial values of variance components under null model of interaction test
}
  \item{est.alt}{

logical: if TRUE estimate variance comonents under the full model. 
}

}
\details{

SPA implements the model based kernel machine method for testing gene-centric gene-gene interaction of Li, S and Cui, Y. (2012).
SPA takes a numerical vector as phenotypes and a numerical data matrix of SNP markers as columns and rows as samples. Markers 
in two genes are ordered as (gene 1, gene 2) and combined together into one matrix. 

This function performs overall genetic effect test and interaction effect test as judged by users. Variance components can also be estimated by setting alt.est=TRUE. 

For a detailed description of usage, input and output, see the example.  
}
\value{
\item{test.overall}{results of the overall test}
\item{test.interaction}{results of the interaction test}
\item{parameter.est.alter}{estimates of variance components under the full model}
}

\references{

Li, S and Cui, Y. (2012) Gene-centric gene-gene interaction: a model-based kernel machine method. Annals of Applied Statistics
}
\author{

Yuehua Cui<cui@stt.msu.edu>
Shaoyu Li<shaoyu.li@stjude.org> 
}
\examples{


## The function is currently defined as
function (Y, G, g.size, cutoff = 0.05, par = NULL, est.alt = FALSE) 
{
    L1 <- g.size[1]
    L2 <- g.size[2]
    Gene1 <- G[, 1:L1]
    Gene2 <- G[, (L1 + 1):ncol(G)]
    w1 <- rep(1, L1)
    w2 <- rep(1, L2)
    K1 <- KERNEL(Gene1, w1)
    K2 <- KERNEL(Gene2, w2)
    K3 <- K1 * K2
    test_o <- Score.Test.Overall(Y, K1, K2, K3)
    if (test_o$p.value < cutoff) {
        if (is.null(par)) {
            grid <- c(0, 1e-05, 1e-04, 0.001, 0.01, 0.1, 1)
            test_i <- est <- vector("list", length(grid))
            for (i in 1:length(grid)) {
                initials <- c(var(Y), rep(grid[i], 2))
                test_i[[i]] <- Score.Test.Interact(Y, K1, K2, 
                  K3, initials, method = "BFGS", test = TRUE)
            }
        }
        if (!is.null(par)) {
            initials <- par
            test_i <- list(Score.Test.Interact(Y, K1, K2, K3, 
                initials, method = "BFGS", test = TRUE))
        }
        test.lr <- c()
        for (i in 1:length(test_i)) {
            test.lr[i] <- test_i[[i]]$restricted.logLik
        }
        test_int <- test_i[[which.max(test.lr)]]
        if (est.alt) {
            initials <- c(test_int$VCs, 0)
            est_res <- Score.Test.Interact(Y, K1, K2, K3, initials, 
                method = "BFGS", test = FALSE)
            res <- list(test.overall = test_o, test.interaction = test_int, 
                parameter.est.alter = est_res)
        }
        else {
            res <- list(test.overall = test_o, test.interaction = test_int)
        }
    }
    else {
        res <- list(test.overall = test_o)
    }
    return(res)
  }
}


