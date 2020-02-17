local iron = require("iron")

iron.core.add_repl_definitions {
  python = {
    mycustom = {
      command = {"mycmd"}
    }
  }
}

iron.core.set_config {
  preferred = {
    python = "ipython"
  },
  repl_open_cmd = "rightbelow 25 split"
}
