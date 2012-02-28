\name{TT}
\alias{TT}

\title{

Returns the trace of the product of two matrices
}
\description{

TT function calculates diagal elements of the product of two matrices and sum them up to return as the trace.
}
\usage{
TT(M1, M2)
}

\arguments{
  \item{M1}{matrix

}
  \item{M2}{matrix

}
}
\value{scale value: trace of the product of the two input matrices

}

\examples{


## The function is currently defined as
function (M1, M2) 
{
    nn <- nrow(M1)
    S <- c()
    for (itt in 1:nn) {
        S[itt] <- sum(M1[itt, ] * M2[, itt])
    }
    trace <- sum(S)
    return(trace)
  }
}

