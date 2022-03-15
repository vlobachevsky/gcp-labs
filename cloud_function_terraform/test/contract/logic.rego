package main

region := "us-central1"
zone := "us-central1-c"

contains_variables(variables) {
  variables.region.value = region
  variables.zone.value = zone
}

deny[msg] {
  not contains_variables(input.variables)
  msg = "Variables are not populated with expected values"
}