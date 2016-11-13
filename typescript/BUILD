package(default_visibility=["//visibility:public"])

load("@org_pubref_rules_node//node:rules.bzl", "node_binary")

node_binary(
    name = "run",
    main = "run.js",
    modules = [
        "@npm_typescript//:modules",
    ],
)

config_setting(
    name = "darwin",
    values = {"host_cpu": "darwin"},
)

config_setting(
    name = "k8",
    values = {"host_cpu": "k8"},
)
