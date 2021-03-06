% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{formula.glmmTMB}
\alias{formula.glmmTMB}
\title{Extract the formula of a glmmTMB object}
\usage{
\method{formula}{glmmTMB}(x, fixed.only = FALSE, component = c("cond", "zi", "disp"), ...)
}
\arguments{
\item{x}{a \code{glmmTMB} object}

\item{fixed.only}{(logical) drop random effects, returning only the fixed-effect component of the formula?}

\item{component}{formula for which component of the model to return (conditional, zero-inflation, or dispersion)}

\item{...}{unused, for generic consistency}
}
\description{
Extract the formula of a glmmTMB object
}
