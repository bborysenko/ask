#!/usr/bin/env bats

NGINX_VERSION=1.9
HAPROXY_VERSION=1.6

@test "nginx ${NGINX_VERSION} is installed" {
    run nginx -v
    [ "$status" -eq 0 ]
    [[ "$output" =~ "${NGINX_VERSION}" ]]
}

@test "haproxy ${HAPROXY_VERSION} is installed" {
    run haproxy -v
    [ "$status" -eq 0 ]
    [[ "$output" =~ "${HAPROXY_VERSION}" ]]
}

@test "curl to http://127.0.0.1/QWE should return upper" {
    run curl -sS --write-out "%{http_code}"  http://127.0.0.1/QWE
    [ "$status" -eq 0 ]
    [[ "$output" =~ "upper" ]]
}

@test "curl to http://127.0.0.1/QWE/RTY should return upper" {
    run curl -sS --write-out "%{http_code}"  http://127.0.0.1/QWE/RTY
    [ "$status" -eq 0 ]
    [[ "$output" =~ "upper" ]]
}

@test "curl to http://127.0.0.1/123 should return upper" {
    run curl -sS --write-out "%{http_code}"  http://127.0.0.1/123
    [ "$status" -eq 0 ]
    [[ "$output" =~ "digit" ]]
}

@test "curl to http://127.0.0.1/123/456 should return upper" {
    run curl -sS --write-out "%{http_code}"  http://127.0.0.1/123/456
    [ "$status" -eq 0 ]
    [[ "$output" =~ "digit" ]]
}

@test "curl to http://127.0.0.1/ should return 404" {
    run curl -sS --write-out "%{http_code}"  http://127.0.0.1/
    [ "$status" -eq 0 ]
    [[ "$output" =~ "404" ]]
}

@test "curl to http://127.0.0.1/QWE/123 should return 404" {
    run curl -sS --write-out "%{http_code}"  http://127.0.0.1/
    [ "$status" -eq 0 ]
    [[ "$output" =~ "404" ]]
}