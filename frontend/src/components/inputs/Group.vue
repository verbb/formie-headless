<script>
import FieldMixin from "@mixins/FieldMixin";

import AllInputs from "@components/inputs";

export default {
  components: AllInputs,

  mixins: [FieldMixin],
};
</script>

<template>
  <field-label :id="getId()" :field="field" position="above-input" />

  <field-instructions :field="field" position="above-input" />

  <fieldset
    class="relative mb-5 bg-gray-100 p-4 rounded-md border border-gray-200"
  >
    <div v-for="(nestedField, fieldIndex) in field.fields" :key="fieldIndex">
      <component
        :is="nestedField.displayName"
        :field="nestedField"
        :namespace="[field.handle]"
      />
    </div>
  </fieldset>

  <field-instructions :field="field" position="below-input" />

  <field-label :id="getId()" :field="field" position="below-input" />
</template>
