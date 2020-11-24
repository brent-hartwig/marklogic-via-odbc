'use strict';

function addWrapper(content, context) {
    const wrapperName = (context.transform_param == undefined)
        ? "UNDEFINED" : context.transform_param;
    if (xdmp.nodeKind(content.value) == 'document' &&
        content.value.documentFormat == 'JSON') {
        const newDoc = {};
        newDoc[wrapperName] = content.value;
        content.value = newDoc;
    }
    return content;
};
exports.addWrapper = addWrapper;
