% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BNP_samplers.R
\name{getSamplesDPmeasure}
\alias{getSamplesDPmeasure}
\title{Get posterior samples for a Dirichlet process measure}
\usage{
getSamplesDPmeasure(MCMC, epsilon = 1e-04)
}
\arguments{
\item{MCMC}{an MCMC class object, either compiled or uncompiled.}

\item{epsilon}{used for determining the truncation level of the representation of the random measure.}
}
\description{
This function obtains posterior samples from a Dirichlet process distributed random measure of a model specified using the \code{dCRP} distribution.
}
\details{
This function provides samples from a random measure having a Dirichlet process prior. Realizations are almost surely discrete and represented by a (finite) stick-breaking representation (Sethuraman, 1994), whose atoms (or point masses) are independent and identically distributed. This sampler can only be used with models containing a \code{dCRP} distribution . 

The \code{MCMC} argument is an object of class MCMC provided by \code{buildMCMC}, or its compiled version. The MCMC should already have been run, as \code{getSamplesDPmeasure} uses the parameter samples to  generates samples for the random measure. Note that the monitors associated with that MCMC must include the cluster membership variable (which has the \code{dCRP} distribution), the cluster parameter variables, all variables directly determining the \code{dCRP} concentration parameter, and any stochastic parent variables of the cluster parameter variables. See \code{help(configureMCMC)} or \code{help(addMonitors)} for information on specifying monitors for an MCMC.

The \code{epsilon} argument is used to determine the truncation level of the random measure. \code{epsilon} is the tail probability of the random measure, which together with posterior samples of the concentration parameter, determines the truncation level (see Section 3 in Gelfand, A.E. and Kottas, A. 2002). The default value is 1e-4.
 
The returned list contains a matrix with samples from the random measure (one sample per row) and the truncation level. The stick-breaking weights are named \code{weights} and the atoms, or point masses, are named based on the cluster variables in the model.
}
\examples{
\dontrun{
  conf <- configureMCMC(model)
  mcmc <- buildMCMC(conf)
  cmodel <- compileNimble(model)
  cmcmc <- compileNimble(mcmc, project = model)
  runMCMC(cmcmc, niter = 1000)
  outputG <- getSamplesDPmeasure(cmcmc)
  samples <- outputG$samples
  truncation <- output$trunc
}
}
\author{
Claudia Wehrhahn and Christopher Paciorek
}
\references{
Sethuraman, J. (1994). A constructive definition of Dirichlet priors. \emph{Statistica Sinica}, 639-650.

Gelfand, A.E. and Kottas, A. (2002). A computational approach for full nonparametric Bayesian inference under Dirichlet process mixture models. \emph{ournal of Computational and Graphical Statistics}, 11(2), 289-305.
}
\seealso{
\code{\link{buildMCMC}}, \code{\link{configureMCMC}},
}

