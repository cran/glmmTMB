% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{isLMM.glmmTMB}
\alias{isLMM.glmmTMB}
\alias{refit.glmmTMB}
\title{support methods for parametric bootstrapping}
\usage{
\method{isLMM}{glmmTMB}(x, ...)

\method{refit}{glmmTMB}(object, newresp, ...)
}
\arguments{
\item{x}{a fitted glmmTMB object}

\item{...}{additional arguments (for generic consistency; ignored)}

\item{object}{a fitted glmmTMB object}

\item{newresp}{a new response vector}
}
\description{
see \code{\link[lme4]{refit}} and \code{\link[lme4:isREML]{isLMM}} for details
}
\details{
These methods are still somewhat experimental (check your results carefully!), but they should allow parametric bootstrapping.  They work by copying and replacing the original response column in the data frame passed to \code{glmmTMB}, so they will only work properly if (1) the data frame is still available in the environment and (2) the response variable is specified as a single symbol (e.g. \code{proportion} or a two-column matrix constructed on the fly with \code{cbind()}. Untested with binomial models where the response is specified as a factor.
}
\examples{
if (requireNamespace("lme4")) {
\dontrun{
   fm1 <- glmmTMB(count~mined+(1|spp),
                  ziformula=~mined,
                  data=Salamanders,
                  family=nbinom1)
   ## single parametric bootstrap step: refit with data simulated from original model
   fm1R <- refit(fm1, simulate(fm1)[[1]])
   ## the bootMer function from lme4 provides a wrapper for doing multiple refits
   ##   with a specified summary function
   b1 <- lme4::bootMer(fm1, FUN=function(x) fixef(x)$zi, nsim=20, .progress="txt")
   if (requireNamespace("boot")) {
      boot.ci(b1,type="perc")
    }
   ## can run in parallel: may need to set up cluster explicitly,
   ## use clusterEvalQ() to load packages on workers
   if (requireNamespace("parallel")) {
      cl <- parallel::makeCluster(2)
      parallel::clusterEvalQ(cl, library("lme4"))
      parallel::clusterEvalQ(cl, library("glmmTMB"))
      b2 <- lme4::bootMer(fm1, FUN = function(x) fixef(x)$cond,
              nsim = 10, ncpus = 2, cl = cl, parallel = "snow")
   }
}
}
}
