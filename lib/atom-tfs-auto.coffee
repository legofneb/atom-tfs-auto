tfs = require 'tfs-unlock'

module.exports = AtomTfsAuto =

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    tfs.init({
      "visualStudioPath": tfs.vs2015.bit32
      });
    @_events()

  _events: ->
    atom.workspace.observeTextEditors (editor) ->
      editor.onDidStopChanging () =>
        if atom.workspace.getActivePaneItem().buffer.file.path?
          tfs.checkout([atom.workspace.getActivePaneItem().buffer.file.path])
