<template>
  <component
    :is="field.displayType"
    :field="field"
    :namespace-suffix="suffix"
  />
</template>

<script>
import FieldMixin from "@mixins/FieldMixin";

import Checkboxes from "@components/inputs/Checkboxes.vue";
import Dropdown from "@components/inputs/Dropdown.vue";
import Radio from "@components/inputs/Radio.vue";

export default {
  components: {
    Checkboxes,
    Dropdown,
    Radio,
  },

  mixins: [FieldMixin],

  computed: {
    suffix() {
      if (this.field.displayType !== "checkboxes") {
        return [""];
      }

      return [];
    },
  },

  created() {
    this.field.options = this.field.entries.map((option) => {
      return { label: option.title, value: option.id };
    });
  },
};
</script>
