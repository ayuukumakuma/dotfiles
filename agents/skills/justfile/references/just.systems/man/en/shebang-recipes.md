---
title: "Shebang Recipes - Just Programmer's Manual"
source_url: "https://just.systems/man/en/shebang-recipes"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Shebang Recipes](https://just.systems/man/en/shebang-recipes.html#shebang-recipes)

Recipes that start with `#!` are called shebang recipes, and are executed by
saving the recipe body to a file and running it. This lets you write recipes in
different languages:

```
polyglot: python js perl sh ruby nu

python:
  #!/usr/bin/env python3
  print('Hello from python!')

js:
  #!/usr/bin/env node
  console.log('Greetings from JavaScript!')

perl:
  #!/usr/bin/env perl
  print "Larry Wall says Hi!\n";

sh:
  #!/usr/bin/env sh
  hello='Yo'
  echo "$hello from a shell script!"

nu:
  #!/usr/bin/env nu
  let hello = 'Hola'
  echo $"($hello) from a nushell script!"

ruby:
  #!/usr/bin/env ruby
  puts "Hello from ruby!"
```

```
$ just polyglot
Hello from python!
Greetings from JavaScript!
Larry Wall says Hi!
Yo from a shell script!
Hola from a nushell script!
Hello from ruby!
```

On Unix-like operating systems, including Linux and MacOS, shebang recipes are
executed by saving the recipe body to a file in a temporary directory, marking
the file as executable, and executing it. The OS then parses the shebang line
into a command line and invokes it, including the path to the file. For
example, if a recipe starts with `#!/usr/bin/env bash`, the final command that
the OS runs will be something like `/usr/bin/env bash /tmp/PATH_TO_SAVED_RECIPE_BODY`.

Shebang line splitting is operating system dependent. When passing a command
with arguments, you may need to tell `env` to split them explicitly by using
the `-S` flag:

```
run:
  #!/usr/bin/env -S bash -x
  ls
```

Windows does not support shebang lines. On Windows, `just` splits the shebang
line into a command and arguments, saves the recipe body to a file, and invokes
the split command and arguments, adding the path to the saved recipe body as
the final argument. For example, on Windows, if a recipe starts with `#! py`,
the final command the OS runs will be something like
`py C:\Temp\PATH_TO_SAVED_RECIPE_BODY`.
