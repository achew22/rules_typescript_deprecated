def impl(ctx):
    # Create a rule that runs tsc on the source file.
    files = []
    for i in ctx.attr.deps:
        # A label can represent any number of files (possibly 0).
        for f in i.files:
            files = files + [f]

    output = ctx.outputs.out

    ctx.action(
        inputs=files,
        outputs=[output],
        executable=ctx.executable.tsc_,
        arguments=["%s" % (output.path)] + (["%s" % x.path for x in files]))

typescript_binary = rule(
    implementation = impl,
    attrs = {
        "tsc_": attr.label(
            default=Label("//typescript:run"),
            allow_files=True,
            executable=True),
        "deps": attr.label_list(allow_files=True),
    },
    outputs = {
        "out": "%{name}.js"
    }
)

def typescript_repositories():
    native.http_file(
        name=  "typescript_darwin_amd64",
        url = "https://files.achew22.com/typescript-1.9.0-darwin-x64.nar",
        sha256 = "49ad400dce6b624c312cfe8c56a0feb39a8f523010ee4cdefe0649b11af17dc1",
        executable = True,
    )

    native.http_file(
        name=  "typescript_linux_amd64",
        url = "https://files.achew22.com/typescript-1.9.0-linux-x64.nar",
        sha256 = "01f56c4bad5a982c2791a872f6b79145f273ee2ef5649ef70a728fe421e72325",
        executable = True,
    )
