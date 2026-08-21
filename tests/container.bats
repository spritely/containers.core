#!/usr/bin/env bats

# Sanity checks for base runtime tools

@test "dotnet is installed" {
    run dotnet --version
    [ "$status" -eq 0 ]
}

@test "python3 is installed" {
    run python3 --version
    [ "$status" -eq 0 ]
}

@test "azure cli is installed" {
    run az version -o tsv
    [ "$status" -eq 0 ]
}

@test "pulumi is installed" {
    run pulumi version
    [ "$status" -eq 0 ]
}

@test "kubectl is installed" {
    run kubectl version --client
    [ "$status" -eq 0 ]
}

# Project-specific tools

@test "docker is installed" {
    run docker --version
    [ "$status" -eq 0 ]
}

@test "sudo is installed" {
    run sudo --version
    [ "$status" -eq 0 ]
}

@test "fuse-overlayfs is installed" {
    run fuse-overlayfs --version
    [ "$status" -eq 0 ]
}

@test "csharpier is installed" {
    run csharpier --version
    [ "$status" -eq 0 ]
}

# Container user

@test "running as the dev user" {
    [ "$(id -un)" = "dev" ]
    [ "$(id -u)" -eq 1000 ]
    [ "$HOME" = "/home/dev" ]
}

@test "dev is a member of the docker group" {
    run getent group docker
    [ "$status" -eq 0 ]
    [[ ",${output##*:}," == *",dev,"* ]]
}

# containers.base dependency validation

@test "apply-templates is installed" {
    run apply-templates --help
    [ "$status" -eq 0 ]
}

@test "merge-xml is installed" {
    [ -x /usr/local/bin/merge-xml ]
}

# Environment configuration

@test "NUGET_XMLDOC_MODE is empty" {
    [ -z "${NUGET_XMLDOC_MODE:-unset}" ] || [ "${NUGET_XMLDOC_MODE}" = "" ]
}

@test "PULUMI_SKIP_UPDATE_CHECK is true" {
    [ "$PULUMI_SKIP_UPDATE_CHECK" = "true" ]
}
