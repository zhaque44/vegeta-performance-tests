#!/bin/bash

vegeta attack -duration=1s -rate=200 -targets=data/urls-with-methods.txt -header="Authorization: Bearer $token" | vegeta report --type=text
