<template>
  <p v-if="canShow()" class="text-sm text-gray-500 mb-1">
    {{ field.instructions }}
  </p>
</template>

<script>
import { upperFirst, camelCase } from "lodash-es";

export default {
  props: {
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

      if (this.field.instructionsPosition == className) {
        return true;
      }

      if (
        !this.field.instructionsPosition &&
        (this.position == "above-input" || this.position == "fieldset-start")
      ) {
        return true;
      }

      return false;
    },
  },
};
</script>
