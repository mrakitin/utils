#!/bin/bash

# kill -9 $(ps -ef | grep sirepo | head -1 | awk '{print $2}') || ps -ef | grep sirepo

ps -ef | grep http | grep -v grep
kill -9 $(ps -ef | grep http | grep -v grep | awk '{print $2}')

