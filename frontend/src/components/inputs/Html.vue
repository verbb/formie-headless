<template>
    <field-label :id="getId()" :field="field" position="above-input" />

    <field-instructions :field="field" position="above-input" />

    <div v-html="field.htmlContent"></div>

    <field-instructions :field="field" position="below-input" />

    <field-label :id="getId()" :field="field" position="below-input" />
</template>

<script>
import FieldMixin from '@mixins/FieldMixin';

export default {
    mixins: [FieldMixin],
};

</script>
