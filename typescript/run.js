#!/usr/bin/env node

// Munge the command line arguments to be what TSC expects.
process.argv =
    [
      'node', process.argv[1],
      '--sourceMap',     // Turn on sourcemaps.
      '--inlineSources', // Include the actual source in the sourcemap.
      '--module', 'amd'
    ].concat([ '--outFile' ])
        .concat(process.argv.slice(2));

require('typescript/lib/tsc.js');
