


#!/bin/bash
# jamf_list_computers.sh
#if [[ -z "${JAMF_BASE_URL:-}" || -z "${JAMF_USERNAME:-}" || -z "${JAMF_PASSWORD:-}" ]]; then
# echo "Missing Jamf credentials."
# exit 1
#fi

# Use curl with the secrets
curl -sku "palladh:dharma9848" -H "Accept: application/xml" https://commonwealdharmffjkr.jamfcloud.com/JSSResource/computers/id/5 | xmllint --format -


