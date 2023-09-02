<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],
};
</script>

<template>
  <field-label :id="getId()" :field="field" position="above-input" />

  <field-instructions :field="field" position="above-input" />

  <input
    v-bind="attrs()"
    type="date"
    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
  />

  <field-instructions :field="field" position="below-input" />

  <field-label :id="getId()" :field="field" position="below-input" />
</template>
