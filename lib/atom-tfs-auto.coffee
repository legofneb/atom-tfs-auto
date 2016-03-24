tfs = require 'tfs-unlock'

module.exports = AtomTfsAuto =

  activate: (state) ->
    tfs.init({
      "visualStudioPath": tfs.vs2015.bit32
      });
    @_events()

  _events: ->
    atom.workspace.observeTextEditors (editor) ->
      editor.onDidStopChanging () ->
        if atom.workspace.getActivePaneItem().buffer.file?.path?
          tfs.checkout([atom.workspace.getActivePaneItem().buffer.file.path])
