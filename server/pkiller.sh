#!/bin/bash

kill -9 $(ps aux | grep http.server | head -1 | awk '{print $2}')
