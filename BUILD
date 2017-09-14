filegroup(
    name = "node_modules",
    # Reduce the number of inputs to avoid hitting File Descriptor limit on Mac
    srcs = glob([
        "node_modules/**/*.js",
        "node_modules/**/*.d.ts",
        "node_modules/**/*.json",
    ]),
    visibility = ["//visibility:public"],
)
