\name{PROJECT}
\alias{PROJECT}

\title{
Column-wise Mean Centered
}
\description{
PROJECT returns a columnwise mean-centered matrix of the input matrix.
}
\usage{
PROJECT(MM)
}
\arguments{
  \item{MM}{matrix
}
}
\value{An object of the same type of M, but with every element been column mean centered.
}
\examples{

## The function is currently defined as
function (MM) 
{
    PMM <- MM - (matrix(1, n, 1) \%*\% apply(MM, 2, sum))/n
    return(PMM)
  }
}

