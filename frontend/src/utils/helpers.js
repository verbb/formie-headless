export const getId = (handles) => {
    // Traditional method
    // return `fields-${handles.join('][')}`;

    return `${handles.join('-')}`;
};

export const getName = (handles) => {
    // Traditional method
    // return `fields[${handles.join('][')}]`;

    const first = handles.shift();

    if (handles.length) {
        return `${first}[${handles.join('][')}]`;
    }

    return first;
};

export const attributesTable = (table) => {
    const attrs = {};

    if (table && Array.isArray(table)) {
        table.forEach((row) => {
            attrs[row.label] = row.value;
        });
    }

    return attrs;
};
