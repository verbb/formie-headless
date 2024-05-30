<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],
};
</script>

<template>
  <FieldLabel :id="getId()" :field="field" position="above-input" />

  <FieldInstructions :field="field" position="above-input" />

  <textarea
    v-bind="attrs()"
    rows="3"
    class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border border-gray-300 rounded-md"
  ></textarea>

  <FieldInstructions :field="field" position="below-input" />

  <FieldLabel :id="getId()" :field="field" position="below-input" />
</template>
