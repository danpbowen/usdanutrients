% Generated by roxygen2 (4.0.1): do not edit by hand
\docType{data}
\name{nutrient}
\alias{nutrient}
\title{Nutrient data table.}
\format{A data frame with 632,894 observations and 18 variables:
\describe{
\item{food_id}{Food identifier. Joins with \code{\link{food}}}
\item{nutr_id}{Nutrient identifier. Joins with \code{\link{nutrient_def}}}
\item{value}{Amount of nutrient in 100g.}
\item{num_points}{Number of analyses used to compute value. If the number
  of data points is 0, the value was calculated or imputed.}
\item{se}{Standard error of the mean. NA if cannot be calculated. The
  standard error is also not given if the number of data points is less
  than three}
\item{source_type_id}{Code indicating type of data. Joins with
  \code{\link{source_type}}}
\item{deriv_id}{Data derivation code. Joins with \code{\link{deriv}}}
\item{impute_id}{Food identifier for the item used to calculate a missing
   value. Populated only for items added or updated starting with SR14.}
\item{fortified}{Indicates a vitamin or mineral added for fortification
  or enrichment. This field is populated for ready-to-eat breakfast cereals
  and many brand-name hot cereals in food group 8. }
\item{num_studies}{Number of studies.}
\item{min,max}{Minimum & maximum value from studies}
\item{df}{degrees of freedom}
\item{lwr,upr}{Lower and upper 95\% CI around mean}
\item{comments}{Statistical comments}
\item{modified}{Month value added or modified}
\item{cc}{Confidence Code indicating data quality, based on evaluation of
  sample plan, sample handling, analytical method, analytical quality
  control, and number of samples analyzed. Not included in this
  release, but is planned for future releases.}
}}
\usage{
nutrient
}
\description{
Nutrient values and information about the values, including expanded
statistical information.
}
\examples{
nutrient

# To find a name nutrient information for a specified food, you need to
# join food, nutrient and nutrient_def
if (require("dplyr") && require("tidyr")) {
  nutr_info <- food \%>\%
    select(food_id, food) \%>\%
    inner_join(nutrient \%>\% select(food_id, nutr_id, value)) \%>\%
    inner_join(nutrient_def \%>\% select(nutr_id, nutr_abbr))

 # Often easiest to understand if you spread the nutrient values out
 # in to columns. We'll do this for the 10 most prevalent nutrients
 top_nutr <- nutrient \%>\%
   group_by(nutr_id) \%>\%
   tally(sort = TRUE) \%>\%
   head(10)

 nutr_info \%>\%
   semi_join(top_nutr) \%>\%
   select(food_id, food, nutr_abbr, value) \%>\%
   spread(nutr_abbr, value)
}
}
\keyword{datasets}

