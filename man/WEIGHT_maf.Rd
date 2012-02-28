\name{WEIGHT_maf}
\alias{WEIGHT_maf}

\title{

Returns minor allele frequency based weights
}
\description{

WEIGHT_maf calculates a weighting scheme based on the minor allele frequency: 1/sqrt(maf)
}
\usage{
WEIGHT_maf(G)
}

\arguments{
  \item{G}{matrix: genotypes data with columns as samples and rows as SNP markers

}
}
\value{a numeric vector of weights defined as 1/sqrt(maf)

}

\examples{


## The function is currently defined as
function (G) 
{
    qs <- apply(G, 1, sum)/nrow(G)
    return(1/sqrt(qs))
}
}

