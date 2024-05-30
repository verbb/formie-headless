<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],
};
</script>

<template>
  <Component :is="field.headingSize" :class="field.headingSize">{{
    field.name
  }}</Component>
</template>
