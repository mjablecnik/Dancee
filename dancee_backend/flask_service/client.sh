#!/bin/bash

curl -X POST -H "Content-Type: application/json" -d '{"name": "Martin", "server": "flask"}' http://localhost:8000/access
