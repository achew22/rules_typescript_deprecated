load("@org_pubref_rules_node//node:rules.bzl", "npm_repository")

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
            cfg = "host",
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
    npm_repository(
        name = "npm_typescript",
        deps = {
            "typescript": "2.0.9",
        },
        sha256 = "9075f59a2b279d68532a48484366c69f0cfa970be6e917b4f36641785a93c3bd"
    )
