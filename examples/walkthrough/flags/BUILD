load("//typescript:def.bzl", "ts_binary", "ts_library")

ts_library(
    name = "lib",
    srcs = [
      "animal.ts",
      "main.ts",
    ]
)

ts_binary(
    name = "flags",
    flags = [
        "--noImplicitAny",
    ],
    deps = [
        ":lib",
    ]
)
