var dataTransfer = {
    dropEffect: '',
    effectAllowed: 'all',
    files: [],
    items: {},
    types: [],
    setData: function(format, data) {
        this.items[format] = data;
        this.types.push(format);
    },
    getData: function(format) {
        return this.items[format];
    },
    clearData: function(format) {}
};
var emit = function(event, target) {
    var evt = document.createEvent('Event');
    evt.initEvent(event, true, false);
    evt.dataTransfer = dataTransfer;
    target.dispatchEvent(evt);
};

var DragNDrop = function(src, tgt) {
    emit('dragstart', src);
    emit('dragenter', tgt);
    emit('dragover', tgt);
    emit('drop', tgt);
    emit('dragend', src);
    return true;
}