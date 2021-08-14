#!/usr/bin/env bash
echo "running mypy: " && ms=$(echo $(python3 -m mypy .))
echo "running flake8: " && fs=$(echo $(python3 -m flake8 .))
if [[ ${ms} =~ ^Success:.*$  ]] && [[ ${fs} == '' ]] ; then
        echo success!
        exit 0
else
        echo failure!
        echo ${ms}
        echo
        echo ${fs}
        exit 1
fi