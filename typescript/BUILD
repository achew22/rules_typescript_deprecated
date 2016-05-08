package(default_visibility=["//visibility:public"])

sh_binary(
    name = "run",
    srcs = [
        "run.sh",
    ],
    data = select({
        ":darwin": ["@typescript_darwin_amd64//file"],
        ":k8": ["@typescript_linux_amd64//file"],
    }),
)


config_setting(
    name = "darwin",
    values = {"host_cpu": "darwin"},
)

config_setting(
    name = "k8",
    values = {"host_cpu": "k8"},
)
