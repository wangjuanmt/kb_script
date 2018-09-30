#!/usr/bin/env fish

function export_polipo_proxy_env_vars --description 'Set polipo proxy environment variables so that requests will be sent to running polipo instance'
    set -gx http_proxy 'http://127.0.0.1:8123/'
    set -gx https_proxy 'http://127.0.0.1:8123/'
    set -gx ftp_proxy 'http://127.0.0.1:8123/'
    set -gx rsync_proxy 'http://127.0.0.1:8123/'
    set -gx no_proxy 'localhost,127.0.0.1'
end
