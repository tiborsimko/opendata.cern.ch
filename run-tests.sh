#!/usr/bin/env bash
#
# This file is part of CERN Open Data Portal.
# Copyright (C) 2015, 2016, 2017, 2018, 2019, 2020, 2024, 2025 CERN.
#
# CERN Open Data Portal is free software; you can redistribute it
# and/or modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of the
# License, or (at your option) any later version.
#
# CERN Open Data Portal is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with CERN Open Data Portal; if not, write to the
# Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA 02111-1307, USA.
#
# In applying this license, CERN does not
# waive the privileges and immunities granted to it by virtue of its status
# as an Intergovernmental Organization or submit itself to any jurisdiction.

set -o errexit
set -o nounset

data_dois() {
    dupes=$(jq '.[].doi' data/{records,skeletons}/*.json | sort | grep -v null | uniq -d)
    if [ "x${dupes}" != "x" ]; then
        echo "[ERROR] Found duplicate record DOIs:"
        echo "${dupes}"
        exit 1
    fi
    echo "Record DOIs are unique."
}

data_json() {
    find . -name "*.json" -exec ./scripts/clean_json_file.py --check {} \+
}

data_licenses() {
    scripts/check_licenses.py
}

data_recids() {
    dupes=$(jq '.[].recid' data/{records,skeletons}/*.json | sort | uniq -d)
    if [ "x${dupes}" != "x" ]; then
        echo "[ERROR] Found duplicate record IDs:"
        echo "${dupes}"
        exit 1
    fi
    echo "Record IDs are unique."
}

data_slugs() {
    # shellcheck disable=SC2044
    dupes=$(for file in $(find data/docs -name "*.json"); do jq '.[].slug' "$file"; done | sort | grep -v null | uniq -d)
    if [ "x${dupes}" != "x" ]; then
        echo "[ERROR] Found duplicate docs slugs:"
        echo "${dupes}"
        exit 1
    fi
    echo "Docs slugs are unique."
}

data_types() {
    # shellcheck disable=SC2044
    for file in $(find data/{records,docs}/ -name "*.json"); do
        secondaries=$(jq '.[].type.secondary' "$file" -c | sort | uniq)
        if echo "$secondaries" | grep -q -e '\[\]' -e "null"; then
            echo "[Warning] empty type.secondary field in $file"
        fi
    done
}

format_black() {
    black --check .
}

format_isort() {
    isort -rc -c -df --profile black -- **/*.py
}

format_shfmt() {
    shfmt -d .
}

format_whitespace() {
    whitespace_found_p=0
    for file in $(git ls-files | grep -E '.(py|html|css|json|md|sh|txt|yml)$'); do
        if grep -q ' $' "$file"; then
            whitespace_found_p=1
            echo "[ERROR] Found trailing whitespace in ${file}."
        fi
    done

    if [ "${whitespace_found_p}" != "0" ]; then
        exit 1
    fi
}

lint_commitlint() {
    from=${2:-master}
    to=${3:-HEAD}
    npx commitlint --from="$from" --to="$to"
    found=0
    while IFS= read -r line; do
        commit_hash=$(echo "$line" | cut -d ' ' -f 1)
        commit_title=$(echo "$line" | cut -d ' ' -f 2-)
        commit_number_of_parents=$(git rev-list --parents "$commit_hash" -n1 | awk '{print NF-1}')
        # (i) skip checking release commits generated by Release Please
        if [ "$commit_number_of_parents" -le 1 ] && echo "$commit_title" | grep -qP "^chore\(.*\): release"; then
            continue
        fi
        # (ii) check absence of merge commits in feature branches
        if [ "$commit_number_of_parents" -gt 1 ]; then
            if echo "$commit_title" | grep -qP "^chore\(.*\): merge "; then
                break # skip checking maint-to-master merge commits
            else
                echo "✖   Merge commits are not allowed in feature branches: $commit_title"
                found=1
            fi
        fi
    done < <(git log "$from..$to" --format="%H %s")
    if [ $found -gt 0 ]; then
        exit 1
    fi
}

lint_flake8() {
    flake8 .
}

lint_jsonlint() {
    find . -name "*.json" -exec jsonlint -q {} \+
}

lint_pydocstyle() {
    pydocstyle scripts
}

lint_shellcheck() {
    find . -name "*.sh" -exec shellcheck {} \+
}

lint_yamllint() {
    yamllint .
}

all() {
    data_dois
    data_json
    data_licenses
    data_recids
    data_slugs
    data_types
    format_black
    format_isort
    format_shfmt
    format_whitespace
    lint_commitlint
    lint_flake8
    lint_jsonlint
    lint_pydocstyle
    lint_shellcheck
    lint_yamllint
}

help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  --all                Perform all checks [default]"
    echo "  --data-dois          Check data DOIs"
    echo "  --data-json          Check data JSON"
    echo "  --data-licenses      Check data licenses"
    echo "  --data-recids        Check data record IDs "
    echo "  --data-slugs         Check data slugs"
    echo "  --data-types         Check data types"
    echo "  --help               Display this help message"
    echo "  --format-black       Check formatting of Python code"
    echo "  --format-isort       Check formatting of Python imports"
    echo "  --format-shfmt       Check formatting of shell scripts"
    echo "  --format-whitespace  Check formatting of whitespace"
    echo "  --lint-commitlint    Check linting of commit messages"
    echo "  --lint-flake8        Check linting of Python code"
    echo "  --lint-jsonlint      Check linting of JSON files"
    echo "  --lint-pydocstyle    Check linting of Python docstrings"
    echo "  --lint-shellcheck    Check linting of shell scripts"
    echo "  --lint-yamllint      Check linting of YAML files"
}

if [ $# -eq 0 ]; then
    all
    exit 0
fi

arg="$1"
case $arg in
--all) all ;;
--help) help ;;
--data-dois) data_dois ;;
--data-json) data_json ;;
--data-licenses) data_licenses ;;
--data-recids) data_recids ;;
--data-slugs) data_slugs ;;
--data-types) data_types ;;
--format-black) format_black ;;
--format-isort) format_isort ;;
--format-shfmt) format_shfmt ;;
--format-whitespace) format_whitespace ;;
--lint-commitlint) lint_commitlint "$@" ;;
--lint-flake8) lint_flake8 ;;
--lint-jsonlint) lint_jsonlint ;;
--lint-pydocstyle) lint_pydocstyle ;;
--lint-shellcheck) lint_shellcheck ;;
--lint-yamllint) lint_yamllint ;;
*) echo "[ERROR] Invalid argument '$arg'. Exiting." && help && exit 1 ;;
esac
