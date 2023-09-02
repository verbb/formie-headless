<template>
  <input v-bind="attrs()" type="hidden" :value="field.defaultValue" />
</template>

<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],
};
</script>
