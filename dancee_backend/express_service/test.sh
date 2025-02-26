#!/bin/bash

curl -X POST -H "Content-Type: application/json" -d '{"name": "Martin", "server": "express"}' http://localhost:3000/api/message
