\name{SPA3G-package}
\alias{SPA3G-package}
\alias{SPA3G}
\docType{package}
\title{
SPA3G		
}
\description{
The package implements the model-based kernel machine method for detecting gene-centric gene-gene interactions of Li and Cui (2012). 
}
\details{
\tabular{ll}{
Package: \tab SPA3G\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2012-02-28\cr
License: \tab GPL-3.0\cr
}

SPA3G conducts statistical test for overall genetic effects of a gene pair and interaction effect between them. 
The overall test is conducted first and users can decide when to perform an interaction test by setting a cutoff value for the overall test p-value. 
REML estimates of variance components can also be reported as required by users.   

To run SPA, appropriately prepared phenotype and genotype datasets are required. For the format of the input data sets, please run "data(SPA_example)"  after install the package.

}
\author{
Shaoyu Li and Yuehua Cui

Shaoyu Li, shaoyu.li@stjude.org\\
Yuehua Cui, cui@stt.msu.edu\\
Erik Segur, segur@stt.msu.edu
}
\references{
Li, S and Cui, Y. (2012) Gene-centric gene-gene interaction: a model-based kernel machine method. Annals of Applied Statistics
}
\examples{
data(SPA.example)
spam.res <- SPA(SPA.example$pheno, SPA.example$geno, g.size=c(1, 3), cutoff=1)
spam.res
}