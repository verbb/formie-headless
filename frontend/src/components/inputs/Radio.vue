<template>
  <fieldset :aria-labelledby="getId()">
    <legend class="block text-sm font-medium text-gray-700 mb-1">
      {{ field.label }}
      <span v-if="field.required" class="text-red-500">*</span>
    </legend>

    <field-instructions :field="field" position="fieldset-start" />

    <div class="mt-2 space-y-2">
      <div
        v-for="(option, index) in field.options"
        :key="index"
        class="flex items-center"
      >
        <input
          :id="getId([index])"
          :name="getName()"
          :value="option.value"
          :required="field.required"
          type="radio"
          class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300"
        />

        <label
          :for="getId([index])"
          class="ml-3 block text-sm font-medium text-gray-700"
        >
          {{ option.label }}
        </label>
      </div>
    </div>

    <field-instructions :field="field" position="fieldset-end" />
  </fieldset>
</template>

<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],
};
</script>
