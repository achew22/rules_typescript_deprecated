def impl(ctx):
    # Create a rule that runs tsc on the source file.
    print(ctx.attr.deps)
    files = []
    for i in ctx.attr.deps:
        print("- %s" % i.label)
        # A label can represent any number of files (possibly 0).
        print("  files = %s" % [f.path for f in i.files])
        for f in i.files:
            files = files + [f]

    output = ctx.outputs.out
    ctx.action(
        inputs=files,
        outputs=[output],
        command="tsc %s --out %s" % (' '.join(["%s" % x.path for x in files]), output.path))

typescript_binary = rule(
    implementation = impl,
    attrs = {
        "deps": attr.label_list(allow_files=True),
    },
    outputs = {
        "out": "%{name}.js"
    }
)

