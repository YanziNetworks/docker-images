#!/bin/sh

alltags() {
    im="$1"
    repo="${2:-registry.hub.docker.com}"

    if echo "$im" | grep -qo '/'; then
        hub="https://${repo}/v2/repositories/$im/tags"
    else
        hub="https://${repo}/v2/repositories/library/$im/tags"
    fi

    # Modified from
    # http://www.googlinux.com/list-all-tags-of-docker-image/index.html to support
    # wget/curl and not rely on jq
    echo "============== Figuring out all tags for $im" >/dev/stderr

    # Get number of pages
    if [ -z "$(command -v curl)" ]; then
        first=$(wget -q -O - "$hub")
    else
        first=$(curl -sL "$hub")
    fi
    count=$(echo "$first" | sed -E 's/\{\s*"count":\s*([0-9]+).*/\1/')
    pagination=$(echo "$first" | grep -Eo '"name":\s*"[a-zA-Z0-9_.-]+"' | wc -l)
    pages=$((count / pagination + 1))

    # Get all tags one page after the other
    i=0
    while [ $i -le $pages ]; do
        i=$((i + 1))
        if [ -z "$(command -v curl)" ]; then
            page=$(wget -q -O - "$hub?page=$i")
        else
            page=$(curl -sL "$hub?page=$i")
        fi
        ptags=$(echo "$page" | grep -Eo '"name":\s*"[a-zA-Z0-9_.-]+"' | sed -E 's/"name":\s*"([a-zA-Z0-9_.-]+)"/\1/')
        echo "$ptags"
    done    
}