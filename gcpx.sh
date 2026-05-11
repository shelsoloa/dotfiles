# gcpx — GCP context switcher for gcloud + Pulumi
#
# Uses gcloud's built-in named configurations to manage multiple accounts/projects.
#
# Usage:
#   gcpx <configuration>
#
# Configurations:
#   oto         → oto-3254        (otolawn account)
#   branebridge → branebridge     (soloa.tech account)
#   exsquared   → exsquared       (soloa.tech account)
##
# Setup:
#   1. Create configs:  gcloud config configurations create <name>
#   2. Set account/project per config:  gcloud config set account/project --configuration=<name>
#   3. Auth each account once:  gcloud auth login --configuration=<name>
#   4. For ADC (Pulumi):  gcloud auth application-default login

function gcpx() {
	local configs="oto branebridge exsquared"

    if [[ -z "$1" ]] || ! echo "$configs" | grep -qw "$1"; then
		echo "Usage: gcpx <oto|branebridge|exsquared>"
	    echo "Active: $(gcloud config configurations list --filter='is_active=true' --format='value(name)')"
		return 1
	fi
	
	gcloud config configurations activate "$1"
	
	export GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project)
    export PULUMI_CONFIG_PASSPHRASE="${PULUMI_CONFIG_PASSPHRASE:-}"

	gcloud auth application-default login

    echo "→ gcloud config: $1"
    echo "→ project: $GOOGLE_CLOUD_PROJECT"
    echo "→ account: $(gcloud config get-value account)"
}
