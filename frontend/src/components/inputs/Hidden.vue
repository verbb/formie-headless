<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],
};
</script>

<template>
  <input v-bind="attrs()" type="hidden" :value="field.defaultValue" />
</template>
