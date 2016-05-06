load("//typescript:def.bzl", "ts_binary", "ts_library")

ts_library(
    name = "lib",
    srcs = [
      "main.ts"
    ],
)

ts_binary(
    name = "classes",
    deps = [
        ":lib",
    ]
)
