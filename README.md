# Ruby Quality Report

## Installation

```sh
gem install quality-report
```

## Usage

```sh
ruby-quality-report
```

After a bit of a wait, it outputs a report in table form:

![Screenshot](screenshot-1@2x.webp)

This is showing, for each author, the percentage of problematic lines of code. Lower is better.


### To improve the relevance, it has two filters.

It excludes:

- authors with fewer than 200 lines of code
- authors with no contributions in the previous 60 days


### In Rails Projects

This works in Rails projects too. It generates the report for the current directory and downwards. In my testing,
I like the results best when run from the `/app` directory. This is how I generated the report, above.


## How it works

It runs a subset of [Rubocop Metrics cops](https://docs.rubocop.org/rubocop/cops_metrics.html) on `*.rb` files that flag single lines or methods:

- [ABC Size](https://docs.rubocop.org/rubocop/cops_metrics.html#metricsabcsize)
- [Block Length](https://docs.rubocop.org/rubocop/cops_metrics.html#metricsblocklength)
- [Block Nesting](https://docs.rubocop.org/rubocop/cops_metrics.html#metricsblocknesting)
- [Cyclomatic Complexity](https://docs.rubocop.org/rubocop/cops_metrics.html#metricscyclomaticcomplexity)
- [Method Length](https://docs.rubocop.org/rubocop/cops_metrics.html#metricsmethodlength)
- [Perceived Complexity](https://docs.rubocop.org/rubocop/cops_metrics.html#metricsperceivedcomplexity)

It then calculates the percentage of warnings per line written, per author. Each failing check is another warning.


## Roadmap

- [ ] Colorize the output to separate high, medium, and low warning percentages.
- [ ] Fix the numerical alignment.
- [ ] Add a `--csv` option.
- [ ] Make the filters configurable.
- [ ] Speed up the scan.
- [ ] Add a progress bar.


## Intent

This is a team management tool to:

- understand the quality of the code your team is producing
- identify programmers who'd benefit from mentorship and education

----

Diving a little deeper, I've seen the phenomenon of micro-economies of bug-creation and bug-fixing develop within teams. Some developers appear to be extremely productive. They write a lot of code. But they also introduce a lot of bugs.

This code quality report doesn't track **bugs** per se. But it does track **quality**. And these warnings correlate strongly with bugs:



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dogweather/ruby-quality-report.
