#!/usr/bin/env bash
# https://gist.github.com/aerickson/37d911e61731a32a04d2ed6cbe9d5378

set -e

wget --recursive -c --level=inf --page-requisites --convert-links --adjust-extension --span-hosts --domains=multietch.com,squarespace-cdn.com https://www.multietch.com

# If you see 429 errors ("Too many requests") try including:
#   --wait=[seconds] --random-wait --continue ${https://www.multietch.com}
# to address the issue.
# https://stackoverflow.com/a/31746893
# https://stackoverflow.com/a/70381069
