<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],

  computed: {
    maxlength() {
      if (this.field.limit && this.field.limitType === "characters") {
        return this.field.limitAmount;
      }

      return null;
    },
  },

  methods: {
    wordCheck(e) {
      if (!this.field.limit || this.field.limitType != "words") {
        return;
      }

      setTimeout(() => {
        const { value } = e.target;
        const wordCount = value.split(/\S+/).length - 1;
        const regex = new RegExp(
          `^\\s*\\S+(?:\\s+\\S+){0,${this.field.limitAmount - 1}}`,
        );

        if (wordCount >= this.field.limitAmount) {
          e.target.value = value.match(regex);
        }
      }, 1);
    },
  },
};
</script>

<template>
  <FieldLabel :id="getId()" :field="field" position="above-input" />

  <FieldInstructions :field="field" position="above-input" />

  <input
    v-bind="attrs()"
    :maxlength="maxlength"
    type="text"
    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
    @keydown="wordCheck"
  />

  <FieldInstructions :field="field" position="below-input" />

  <FieldLabel :id="getId()" :field="field" position="below-input" />
</template>
