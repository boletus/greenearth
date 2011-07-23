#!/bin/bash
mvn clean process-test-resources -Dmaven.test.skip=true -Pinit-db
