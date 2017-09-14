package(default_visibility = ["//visibility:public"])

load("@build_bazel_rules_nodejs//:defs.bzl", "nodejs_binary")

nodejs_binary(
    name = "run",
    data = [
        "run.js",
        "@//:node_modules",
    ],
    entry_point = "com_github_achew22_bazel_typescript/typescript/run.js",
)
