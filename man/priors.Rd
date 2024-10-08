% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/priors.R
\name{priors}
\alias{priors}
\title{use of priors in glmmTMB}
\description{
(EXPERIMENTAL/subject to change)
}
\details{
\code{glmmTMB} can accept prior specifications, for doing maximum \emph{a posteriori} (MAP) estimation (or Hamiltonian MC with the \code{tmbstan} package), or (outside of a Bayesian framework) for the purposes of regularizing parameter estimates  

The \code{priors} argument to \code{glmmTMB} must (if not NULL) be a data frame with columns
\describe{
\item{\code{prior}}{character; the prior specification, e.g. "normal(0,2)"}
\item{\code{class}}{the name of the underlying parameter vector on which to impose the prior ("fixef", "fixef_zi", "fixef_disp", "ranef", "ranef_zi", "psi")}
\item{\code{coef}}{(optional) a string (if present) specifying the particular elements of the parameter vector to apply the prior to. \code{coef} should specify an integer parameter index, a column name from the fixed effect model matrix or a grouping variable for a random effect (the behaviour is currently undefined if there is more one than random effect term with the same grouping variable in a model ...); one can also append "_cor" or "_sd" to a random-effects \code{class} specification to denote the correlation parameters, or all of the standard deviation parameters, corresponding to a particular random effect term. If the \code{class} element is missing, or a particular element is blank, then all of the elements of the specified parameter vector use independent priors with the given specification. The exception is for the fixed-effect parameter vectors ("fixef", "fixef_zi", "fixef_disp"), where the intercept (if present) is not included; the prior on the intercept must be set explicitly.}
}
`The available prior distributions are:
\itemize{
\item "normal" (mean/sd parameterization)
\item "t" (mean/sd/df)
\item "cauchy" (location/scale)
\item "gamma" (mean/shape); applied on the SD (\emph{not} the log-SD) scale
\item "lkj" (correlation) [WARNING, maybe buggy at present!]
}
The first three are typically used for fixed effect parameters; the fourth for standard deviation parameters; and the last for correlation structures. See the "priors" vignette for examples and further information.
}
\examples{

data("sleepstudy", package = "lme4")
prior1 <- data.frame(prior = c("normal(250,3)","t(0,3,3)","gamma(10,1)"),
                     class = c("fixef", "fixef", "ranef_sd"),
                     coef = c("(Intercept)", "Days", "Subject"))
g1 <- glmmTMB(Reaction ~ 1 + Days + (1 + Days |Subject), sleepstudy)
update(g1, priors = prior1)
prior2 <- data.frame(prior = c("t(0,3,3)","gamma(10,1)"),
                     class = c("fixef", "ranef_sd"),
                     coef = c("", "Subject"))
update(g1, priors = prior2)
## no prior is set for the intercept in this case - see Details above
prior3 <- data.frame(prior = "t(0, 3, 3)",
                     class = "fixef")
update(g1, priors = prior3)

}
