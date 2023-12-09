# Guile Scheme PostgreSQL Language Extension (Scruple)

This project joins my favorite database to my favorite programming
language.

## Status

Demoable. Scruple supports creating scheme functions which can accept
and return all built-in Postgres types. It also supports executing
queries from scheme functions. Current stable(ish) release is 0.6.0,
though be warned that anything off of the knife edge of the happy path
is likely to cause a crash.

## Overview

This project provides a PostgreSQL extension that enables the creation
of database functions using Guile Scheme.

## Features

- Define and run PostgreSQL functions in Guile Scheme
- Comprehensive testing suite

## Roadmap

The scope of the 1.0 release is detailed below.

The 0.7.x versions will add support for tsvector, tsquery, jsonpath,
domain, and range types.

The 0.9.x versions will improve support for jsonb, providing
procedures that map to/from JSON according to the following: objects
map to alists with string keys, arrays map to vectors, `true` maps to
`#t`, `false` maps to `#f`, `null` maps to `'null`, strings map to
strings, and numbers map to numbers.

The 0.11.x versions will add support for cursors and iterative query
result handling.

The 0.13.x versions will add support for triggers.

The 0.15.x versions will add support for inline calls, i.e. "do"
statements.

The 0.17.x versions will provide function isolation, and initialization
and configuration settings.

The 0.19.x versions will normalize error messages and properly trap
and report errors from Guile.

Version 0.20.0 will be the pre-1.0 alpha release. At this point, the
extension will be functionally complete.

The 0.21.x versions will refine and refactor scruple.scm.

The 0.23.x versions will include documentation and examples.

The 0.25.x versions will provide support for Postgres 12, 13, 15, and
16.

The 0.27.x versions will provide packaging for pgxn, deb, rpm, and apk.

Version 0.28.0 will be the pre-1.0 beta release.

Post 1.0 improvements:

The 1.1.x versions will adapt Racket's SQL interface.

The 1.3.x versions will add support for the foreign data wrapper
interface.

## Requirements

- PostgreSQL 14
- Guile 3.0
- Ubuntu 22.04

## Development Setup

Install docker.  To create the test image

    test/build-container-image

To start a test monitor running Postgres 14

    test/start-test-container 14 && docker logs -f scruple-test-14

That runs `pg-start` builds and installs `pgTAP` and `scruple` and
then enters an infinite loop containing `inotifywait` watching a few
key dependencies. When one of those changes, it rebuilds and
reinstalls `scruple` and then calls `pg_prove` on the tests in
`test/tests.sql`.

## Installation

For now, it's just a source install.

```bash
git clone https://github.com/imofftoseethewizard/scruple.git
cd scruple
make
sudo make install
```

I'll put this on `pgxn` at some point in the future.

## Usage

Once installed, you can use the extension within PostgreSQL by
creating functions in Guile Scheme. See the `doc/` directory for
detailed documentation and examples.

## Testing

Test code, scripts, and data are located in the `test/` directory. To
run the tests, execute:

```bash
make test
```

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact

For questions, comments, or suggestions, please open an issue on GitHub.

## History

This project is a test of using ChatGPT on a green-field programming
task. It was started in early August of 2023.
