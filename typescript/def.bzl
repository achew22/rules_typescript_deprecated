ts_filetype = FileType([".ts"])

def get_transitive_files(ctx):
  s = depset()
  for dep in ctx.attr.deps:
    s += dep.transitive_files
  s += ctx.files.srcs
  return s

def ts_library_impl(ctx):
  return struct(
      files=depset(),
      transitive_files=get_transitive_files(ctx))

def ts_binary_impl(ctx):
  files = list(get_transitive_files(ctx))
  output = ctx.outputs.out

  ctx.action(
      inputs=files,
      outputs=[output, ctx.outputs.sourcemap],
      executable=ctx.executable.tsc_,
      arguments=["%s" % (output.path)] + \
          ["%s" % f for f in ctx.attr.flags] + \
          ["%s" % x.path for x in files])

ts_library = rule(
    attrs = {
        "srcs": attr.label_list(allow_files = ts_filetype),
        "deps": attr.label_list(allow_files = False),
    },
    implementation = ts_library_impl,
)

ts_binary = rule(
    attrs = {
        "tsc_": attr.label(
            cfg = "host",
            default = Label("//typescript:run"),
            allow_files = True,
            executable = True,
        ),
        "deps": attr.label_list(allow_files = True),
        "srcs": attr.label_list(allow_files = ts_filetype),
        "flags": attr.string_list(),
    },
    outputs = {
        "out": "%{name}.js",
        "sourcemap": "%{name}.js.map",
    },
    implementation = ts_binary_impl,
)

def typescript_repositories():
  pass
