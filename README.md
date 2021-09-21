# vegeta-performance-tests

## Prerequisites

### Vegeta

The tests will be written in [Vegeta](https://github.com/tsenart/vegeta/blob/master/README.md). Vegeta is a versatile HTTP load testing tool built out of a need to drill HTTP services with a constant request rate. It can be used both as a command line utility and a library.

## Install

```
brew update && brew install vegeta
```

## Test Runner
```bash
$ vegeta attack -duration=1s -rate=200 -targets=data/urls-with-methods.txt -header="Authorization: Bearer $token" | vegeta report --type=text
```

### `attack`
Invokes the performance test runner and allows you to specify the file whose content will be set as the body of every
request
### `duration`
Specifies the amount of time you want the tests to run. The CLI allows you to pass in a variable (example in above command). You can pass in `0` as an integer for infinite runtime of your test scenario.
### `rate`
Specifies the request rate per test run. If you don't specify the rate through the CLI, then `1s` becomes the default. To give you an example on usage for our specific load scenario above, we're executing 200 concuurent requests per second.
### `target`
This is where you can specify which endpoint you want to test. Typically you will specify the http method & the endpoint being tested:
```
GET https://endpoint
```
## Reports
Every load test that is executed will write the results out to `stdout` in text, which can be specified using the `--type` CLI flag. The results from the run will display in your terminal:
```
Requests      [total, rate, throughput]         200, 201.09, 6.49
Duration      [total, attack, wait]             30.666s, 994.567ms, 29.671s
Latencies     [min, mean, 50, 90, 95, 99, max]  2.855s, 4.391s, 4.286s, 4.969s, 5.113s, 6.15s, 30.006s
Bytes In      [total, mean]                     8379933, 41899.67
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           99.50%
Status Codes  [code:count]                      0:1  200:199 
```
