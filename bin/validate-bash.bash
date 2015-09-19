#!/bin/bash -e

function main()
{
    local -r projectPath="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

    # shellcheck source=/dev/null
    source "${projectPath}/libraries/util.bash"

    local -r command='shellcheck'

    checkExistCommand "${command}" "command '${command}' not found. Run '${projectPath}/cookbooks/shell-check/recipes/install.bash' to install"

    find "${projectPath}" -type f -name '*.bash' -exec "${command}" -s bash {} \; -print
}

main "${@}"