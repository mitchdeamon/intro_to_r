#install.packages("data.table")
library(ggplot2)
library(dplyr)
library(data.table)
load("suicides.rdata")

all.suicides <- copy(suicides)

suicides <- suicides %>%
  group_by(year, state, means) %>%
  mutate(deaths = sum(deaths))

# the basics
bare <- ggplot(suicides)

## adding plot aesthetics
aesthetic <- ggplot(suicides, aes(x=year, y=death))

## adding points
scatter <- ggplot(suicides, aes(x=year, y=deaths)) +
            geom_point()
## split "means" by color
color.by.means <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
                   geom_point()

## facet by state
state.facet <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
                geom_line() +
                facet_wrap(~state, scales="free")

## line plot
line.by.state <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
                    geom_point() +
                    facet_wrap(~state, scales="free")

## bar plot
state.facet <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
                geom_bar() +
                facet_wrap(~state, scales="free")