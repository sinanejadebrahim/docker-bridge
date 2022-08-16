#!/bin/bash

kill $(ps aux | grep http.server | head -1 | awk '{print $2}')
