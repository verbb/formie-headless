<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],
};
</script>

<template>
  <FieldLabel :id="getId()" :field="field" position="above-input" />

  <FieldInstructions :field="field" position="above-input" />

  <select
    :id="getId()"
    :name="getName()"
    :multiple="field.multiple"
    :required="field.required"
    class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"
  >
    <option
      v-for="(option, index) in field.options"
      :key="index"
      :value="option.value"
    >
      {{ option.label }}
    </option>
  </select>

  <FieldInstructions :field="field" position="below-input" />

  <FieldLabel :id="getId()" :field="field" position="below-input" />
</template>
