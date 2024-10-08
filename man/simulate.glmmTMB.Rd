% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{simulate.glmmTMB}
\alias{simulate.glmmTMB}
\title{Simulate from a glmmTMB fitted model}
\usage{
\method{simulate}{glmmTMB}(object, nsim = 1, seed = NULL, re.form = NULL, ...)
}
\arguments{
\item{object}{glmmTMB fitted model}

\item{nsim}{number of response lists to simulate. Defaults to 1.}

\item{seed}{random number seed}

\item{re.form}{(Not yet implemented)}

\item{...}{extra arguments}
}
\value{
returns a list of vectors. The list has length \code{nsim}.
Each simulated vector of observations is the same size as the vector of response variables in the original data set.
In the binomial family case each simulation is a two-column matrix with success/failure.
}
\description{
Simulate from a glmmTMB fitted model
}
\details{
Random effects are also simulated from their estimated distribution.
Currently, it is not possible to condition on estimated random effects.
}
