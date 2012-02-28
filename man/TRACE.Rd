\name{TRACE}
\alias{TRACE}

\title{

Returns trace of a square matrix 
}
\description{

TRACE calculates the trace of a square matrix and returns a scale value.
}
\usage{
TRACE(M)
}

\arguments{
  \item{M}{Square matrix

}
}

\examples{

## The function is currently defined as
function (M) 
{
    return(sum(diag(M)))
  }
}

