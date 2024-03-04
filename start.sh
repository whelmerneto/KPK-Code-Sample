#!/bin/bash

sh infraestrutura/provider/kubernetes/build.sh api-tm
docker run -d -p 80:80 api-tm --name api-tm
