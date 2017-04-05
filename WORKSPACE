workspace(name = "com_github_achew22_bazel_typescript")

git_repository(
    name = "org_pubref_rules_node",
    commit = "c5ec209558b57657fc4c5e16b247e3b2af30f2c8",
    remote = "https://github.com/achew22/rules_node.git",
)

load("@org_pubref_rules_node//node:rules.bzl", "node_repositories")

node_repositories()

load("//typescript:def.bzl", "typescript_repositories")
typescript_repositories()

