status is-interactive || exit

# TODO: refactor to put the fisher logic back in here.

if ! type -q fisher
    echo "Fisher is not installed. Please run bootstrap-fisher."
end
