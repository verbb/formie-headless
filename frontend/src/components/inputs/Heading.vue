<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],
};
</script>

<template>
  <component :is="field.headingSize" :class="field.headingSize">{{
    field.name
  }}</component>
</template>
