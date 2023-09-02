<template>
  <label
    v-if="canShow()"
    :for="id"
    class="block text-sm font-medium text-gray-700 mb-1"
  >
    {{ field.label }} <span v-if="field.required" class="text-red-500">*</span>
  </label>
</template>

<script>
import { upperFirst, camelCase } from "lodash-es";

export default {
  props: {
    id: {
      type: String,
      default: "",
    },

    field: {
      type: Object,
      default: () => {},
    },

    position: {
      type: String,
      default: "above-input",
    },
  },

  methods: {
    canShow() {
      const className = `verbb\\formie\\positions\\${upperFirst(
        camelCase(this.position),
      )}`;

      if (this.field.labelPosition == className) {
        return true;
      }

      if (!this.field.labelPosition && this.position == "above-input") {
        return true;
      }

      return false;
    },
  },
};
</script>
