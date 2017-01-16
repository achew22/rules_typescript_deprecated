# Bazel build rules for building TypeScript projects

These build rules allow TypeScript to be compiled by [Bazel](http://bazel.io).


To load Typescript into your repo:

```
#### rules_node is a dependency so it must be included.

git_repository(
    name = "org_pubref_rules_node",
    commit = "99f4b5711612df28e4d874dda05c2c83ae0ff3b6",
    remote = "https://github.com/achew22/rules_node.git",
)

load("@org_pubref_rules_node//node:rules.bzl", "node_repositories")

node_repositories()
git_repository(
    name = "com_github_achew22_rules_typescript",
    commit = "af5be8b0d271f1e29b417413e7a2a35ccf6edb5e",
    remote = "https://github.com/achew22/rules_typescript",
)

load("@com_github_achew22_rules_typescript//typescript:def.bzl", "typescript_repositories")
typescript_repositories()
```

Now you can import the build rules and use them like in this repo:

```
# BUILD
load("@com_github_achew22_bazel_typescript//typescript:def.bzl", "ts_library", "ts_binary")

ts_library(
    name = "lib",
    srcs = ["main.ts"],
)

ts_binary(
    name = "visionics",
    flags = [
        "--pretty",
    ],
    deps = [
        ":lib",
    ],
)
```

And:

```
# main.ts
alert("Hello world")
```

To try it out in this repo with the examples:

 1. Install Bazel
 1. Clone this repo
 1. Run `bazel build //examples/walkthrough/...`
 1. View the output in bazel-out/examples/walkthrough/*
