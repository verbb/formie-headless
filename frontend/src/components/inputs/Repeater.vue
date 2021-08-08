<template>
    <field-label :id="getId()" :field="field" position="above-input" />

    <field-instructions :field="field" position="above-input" />

    <fieldset v-for="(row, rIndex) in rows" :key="row.__id" class="relative mb-5 bg-gray-100 p-4 rounded-md border border-gray-200">
        <div v-for="(nestedField, fieldIndex) in field.fields" :key="fieldIndex">
            <component :is="nestedField.displayName" :field="nestedField" :namespace="[field.handle, 'rows', rIndex]" />
        </div>

        <button type="button" class="absolute top-0 right-0 -mr-3 -mt-3 bg-white p-1 border border-gray-300 rounded-full shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 transform rotate-45 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" @click.prevent="onDelete(rIndex)">
            <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true"><path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd" /></svg>
        </button>
    </fieldset>

    <button type="button" class="bg-white py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" @click.prevent="onAdd">Add row</button>

    <field-instructions :field="field" position="below-input" />

    <field-label :id="getId()" :field="field" position="below-input" />
</template>

<script>
import { uniqueId } from 'lodash-es';

import FieldMixin from '@mixins/FieldMixin';

import AllInputs from '@components/inputs';

export default {
    components: AllInputs,

    mixins: [FieldMixin],

    data() {
        return {
            rows: [],
        };
    },

    methods: {
        onAdd() {
            this.rows.push({
                __id: uniqueId(),
            });
        },

        onDelete(rIndex) {
            this.rows.splice(rIndex, 1);
        },
    },
};

</script>
