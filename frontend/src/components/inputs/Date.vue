<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],
};
</script>

<template>
  <FieldLabel :id="getId()" :field="field" position="above-input" />

  <FieldInstructions :field="field" position="above-input" />

  <input
    v-bind="attrs()"
    type="date"
    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
  />

  <FieldInstructions :field="field" position="below-input" />

  <FieldLabel :id="getId()" :field="field" position="below-input" />
</template>
