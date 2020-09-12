// IPython.CodeCell.options_default.cm_config.autoCloseBrackets = false;

function _apply_cm_options(config) {
    config.configureMouse = (cm, repeat, ev) => ({ addNew : false });
}

define([
    'base/js/namespace',
], function(Jupyter, promises) {
    _apply_cm_options(Jupyter.CodeCell.options_default.cm_config);
    // Somehow there could be existing cells when this runs...
    Jupyter.notebook.get_cells().map(
        function(c) {
            _apply_cm_options(c.code_mirror.options);
        }
    );
});
