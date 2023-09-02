<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],
};
</script>

<template>
  <FieldLabel :id="getId()" :field="field" position="above-input" />

  <FieldInstructions :field="field" position="above-input" />

  <div class="mt-2 space-y-2">
    <input
      type="hidden"
      aria-checked="false"
      aria-hidden="true"
      :name="getName()"
      value=""
    />

    <div class="flex items-center">
      <input
        :id="getId()"
        :name="getName()"
        value="1"
        type="checkbox"
        :required="field.required"
        class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300 rounded"
      />

      <label
        :for="getId()"
        class="ml-3 block text-sm font-medium text-gray-700"
      >
        {{ field.descriptionHtml }}
      </label>
    </div>
  </div>

  <FieldInstructions :field="field" position="below-input" />

  <FieldLabel :id="getId()" :field="field" position="below-input" />
</template>
