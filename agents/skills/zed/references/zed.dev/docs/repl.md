---
title: "REPL | REPL - Jupyter Kernels in Zed"
source_url: "https://zed.dev/docs/repl"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [REPL](https://zed.dev/docs/repl.html#repl)

## [Getting started](https://zed.dev/docs/repl.html#getting-started)

Zed's built-in REPL uses [Jupyter kernels](https://docs.jupyter.org/en/latest/projects/kernels.html) so you can run code interactively in regular editor files.

[

](https://customer-snccc0j9v3kfzkif.cloudflarestream.com/aec66e79f23d6d1a0bee5e388a3f17cc/downloads/default.mp4)

## [Installation](https://zed.dev/docs/repl.html#installation)

Zed supports running code in multiple languages. To get started, you need to install a kernel for the language you want to use.

**Currently supported languages:**

* [Python (ipykernel)](https://zed.dev/docs/repl.html#python)
* [TypeScript (Deno)](https://zed.dev/docs/repl.html#typescript-deno)
* [R (Ark)](https://zed.dev/docs/repl.html#r-ark)
* [R (Xeus)](https://zed.dev/docs/repl.html#r-xeus)
* [Julia](https://zed.dev/docs/repl.html#julia)
* [Scala (Almond)](https://zed.dev/docs/repl.html#scala)

Once installed, you can start using the REPL in the respective language files, or other places those languages are supported, such as Markdown. If you recently added the kernels, run the `repl: refresh kernelspecs` command to make them available in the editor.

## [Using the REPL](https://zed.dev/docs/repl.html#using-the-repl)

To start the REPL, open a file with the language you want to use and use the `repl: run` command (defaults to `ctrl-shift-enter` on macOS) to run a block, selection, or line. You can also click on the REPL icon in the toolbar.

The `repl: run` command will be executed on your selection(s), and the result will be displayed below the selection.

Outputs can be cleared with the `repl: clear outputs` command, or from the REPL menu in the toolbar.

### [Cell mode](https://zed.dev/docs/repl.html#cell-mode)

Zed supports [notebooks as scripts](https://jupytext.readthedocs.io/en/latest/formats-scripts.html) using the `# %%` cell separator in Python and `// %%` in TypeScript. This allows you to write code in a single file and run it as if it were a notebook, cell by cell.

The `repl: run` command will run each block of code between the `# %%` markers as a separate cell.

```
# %% Cell 1
import time
import numpy as np

# %% Cell 2
import matplotlib.pyplot as plt
import matplotlib.pyplot as plt
from matplotlib import style
style.use('ggplot')
```

## [Language specific instructions](https://zed.dev/docs/repl.html#language-specific-instructions)

### [Python](https://zed.dev/docs/repl.html#python)

#### [Global environment](https://zed.dev/docs/repl.html#global-environment)

On macOS, your system Python will *not* work. Either set up [pyenv](https://github.com/pyenv/pyenv?tab=readme-ov-file#installation) or use a virtual environment.

To setup your current Python to have an available kernel, run:

```
pip install ipykernel
python -m ipykernel install --user
```

#### [Conda Environment](https://zed.dev/docs/repl.html#conda-environment)

```
source activate myenv
conda install ipykernel
python -m ipykernel install --user --name myenv --display-name "Python (myenv)"
```

#### [Virtualenv with pip](https://zed.dev/docs/repl.html#virtualenv-with-pip)

```
source activate myenv
pip install ipykernel
python -m ipykernel install --user --name myenv --display-name "Python (myenv)"
```

### [R (Ark Kernel)](https://zed.dev/docs/repl.html#r-ark)

Install [Ark](https://github.com/posit-dev/ark/releases) by downloading the release for your operating system. For example, for macOS just unpack `ark` binary and put it into `/usr/local/bin`. Then run:

```
ark --install
```

### [R (Xeus Kernel)](https://zed.dev/docs/repl.html#r-xeus)

* Install [Xeus-R](https://github.com/jupyter-xeus/xeus-r)
* Install the R Extension for Zed (search for `R` in Zed Extensions)

### [TypeScript: Deno](https://zed.dev/docs/repl.html#typescript-deno)

* [Install Deno](https://docs.deno.com/runtime/manual/getting_started/installation/) and then install the Deno jupyter kernel:

```
deno jupyter --install
```

### [Julia](https://zed.dev/docs/repl.html#julia)

* Download and install Julia from the [official website](https://julialang.org/downloads/).
* Install the Julia Extension for Zed (search for `Julia` in Zed Extensions)

### [Scala](https://zed.dev/docs/repl.html#scala)

* [Install Scala](https://www.scala-lang.org/download/) with `cs setup` (Coursier):
  + `brew install coursier/formulas/coursier && cs setup`
* REPL (Almond) [setup instructions](https://almond.sh/docs/quick-start-install):
  + `brew install --cask temurin` (Eclipse foundation official OpenJDK binaries)
  + `brew install coursier/formulas/coursier && cs setup`
  + `coursier launch --use-bootstrap almond -- --install`

## [Changing which kernel is used per language](https://zed.dev/docs/repl.html#changing-kernels)

Zed automatically detects available kernels and organizes them in the kernel picker:

* **Recommended**: The Python environment matching your active toolchain (if detected)
* **Python Environments**: Virtual environments (venv, virtualenv, Poetry, Pipenv, Conda, uv, etc.)
* **Jupyter Kernels**: Installed Jupyter kernelspecs
* **Remote Servers**: Connected remote Jupyter servers

### [Installing ipykernel](https://zed.dev/docs/repl.html#installing-ipykernel)

Python environments appear in the picker even if ipykernel is not installed. Environments missing ipykernel are dimmed and labeled "ipykernel not installed." When you select one, Zed automatically runs `pip install ipykernel` in that environment and activates it once installation completes.

### [How Zed Recommends Kernels](https://zed.dev/docs/repl.html#how-zed-recommends-kernels)

When you run code, Zed selects a kernel automatically:

1. **Active toolchain match**: If a Python environment matches your active toolchain and has ipykernel, Zed uses it
2. **First available Python env**: Otherwise, the first Python environment with ipykernel
3. **Language-based fallback**: If no Python envs are ready, Zed picks a Jupyter kernel matching the code block's language

You can override this by explicitly selecting a kernel from the picker.

### [Setting Default Kernels](https://zed.dev/docs/repl.html#setting-default-kernels)

To configure a different default kernel for a language, you can assign a kernel for any supported language in your `settings.json`:

```
{
  "jupyter": {
    "kernel_selections": {
      "python": "conda-env",
      "typescript": "deno",
      "javascript": "deno",
      "r": "ark"
    }
  }
}
```

## [Interactive Input](https://zed.dev/docs/repl.html#interactive-input)

When code execution requires user input (such as Python's `input()` function), the REPL displays an input prompt below the cell output.

Type your response in the text field and press `Enter` to submit. The kernel receives your input and continues execution.

For password inputs, characters appear masked with asterisks for security.

If execution is interrupted while an input prompt is active, the prompt automatically clears when the kernel returns to idle state.

## [Debugging Kernelspecs](https://zed.dev/docs/repl.html#debugging-kernelspecs)

Available kernels are shown via the `repl: sessions` command. To refresh the kernels you can run, use the `repl: refresh kernelspecs` command.

If you have `jupyter` installed, you can run `jupyter kernelspec list` to see the available kernels.

```
$ jupyter kernelspec list
Available kernels:
  ark                   /Users/z/Library/Jupyter/kernels/ark
  conda-base            /Users/z/Library/Jupyter/kernels/conda-base
  deno                  /Users/z/Library/Jupyter/kernels/deno
  python-chatlab-dev    /Users/z/Library/Jupyter/kernels/python-chatlab-dev
  python3               /Users/z/Library/Jupyter/kernels/python3
  ruby                  /Users/z/Library/Jupyter/kernels/ruby
  rust                  /Users/z/Library/Jupyter/kernels/rust
```

> Note: Zed makes best effort usage of `sys.prefix` and `CONDA_PREFIX` to find kernels in Python environments. If you want explicitly control run `python -m ipykernel install --user --name myenv --display-name "Python (myenv)"` to install the kernel directly while in the environment.

[Debugger](https://zed.dev/docs/debugger.html "Debugger")
[Git](https://zed.dev/docs/git.html "Git")
