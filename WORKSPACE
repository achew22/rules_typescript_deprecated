workspace(name = "com_github_achew22_bazel_typescript")

git_repository(
    name = "org_pubref_rules_node",
    commit = "99f4b5711612df28e4d874dda05c2c83ae0ff3b6",
    remote = "https://github.com/achew22/rules_node.git",
)

load("@org_pubref_rules_node//node:rules.bzl", "node_repositories")

node_repositories()

load("//typescript:def.bzl", "typescript_repositories")
typescript_repositories()

