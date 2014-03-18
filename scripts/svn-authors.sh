#!/bin/bash

repo=$1

svn log $repo --quiet --xml | grep author | sed -E "s:&lt;/?author&gt;;::g" | sort | uniq
