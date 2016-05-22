ts_filetype = FileType([".ts"])

def get_transitive_files(ctx):
  s = set()
  for dep in ctx.attr.deps:
    s += dep.transitive_files
  s += ctx.files.srcs
  return s

def ts_library_impl(ctx):
  return struct(
      files=set(),
      transitive_files=get_transitive_files(ctx))

def ts_binary_impl(ctx):
  files = list(get_transitive_files(ctx))
  output = ctx.outputs.out

  ctx.action(
      inputs=files,
      outputs=[output],
      executable=ctx.executable.tsc_,
      env={
          "FLAGS": ' '.join(ctx.attr.flags),
      },
      arguments=["%s" % (output.path)] + \
          ["%s" % x.path for x in files])

ts_library = rule(
  implementation = ts_library_impl,
  attrs = {
      "srcs": attr.label_list(allow_files=ts_filetype),
      "deps": attr.label_list(allow_files=False),
  },
)

ts_binary = rule(
    implementation = ts_binary_impl,
    attrs = {
        "tsc_": attr.label(
            default=Label("//typescript:run"),
            allow_files=True,
            executable=True),
        "deps": attr.label_list(allow_files=True),
        "srcs": attr.label_list(allow_files=ts_filetype),
        "flags": attr.string_list(),
    },
    outputs = {
        "out": "%{name}.js"
    }
)

def typescript_repositories():
    native.http_file(
        name=  "typescript_darwin_amd64",
        url = "http://typescript.bazel.achew22.com/typescript-1.9.0-darwin-x64.nar",
        sha256 = "6f14f4efe3e24d4fcee060455979f3a68e59e56463716d6ee9a2cfa54976f4bf",
        executable = True,
    )

    native.http_file(
        name=  "typescript_linux_amd64",
        url = "http://typescript.bazel.achew22.com/typescript-1.9.0-linux-x64.nar",
        sha256 = "e62bb3280e6853cfb4f9cdee3f3580e1e6a8020f6fd95b06ff5408ecd2c92327",
        executable = True,
    )
