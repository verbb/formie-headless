<template>
  <div v-show="pageIndex === activePage">
    <div class="bg-white p-4 sm:p-6 pb-0">
      <div v-if="form.settings.displayCurrentPageTitle">
        <h3 class="text-lg leading-6 font-medium text-gray-900 mb-6">
          {{ page.name }}
        </h3>
      </div>

      <div
        v-for="(row, rowIndex) in page.rows"
        :key="rowIndex"
        class="flex flex-wrap"
      >
        <formie-field
          v-for="(field, fieldIndex) in row.fields"
          :key="fieldIndex"
          :field="field"
        />
      </div>
    </div>

    <div class="px-4 sm:px-6 py-3 bg-gray-50">
      <div class="flex" :class="position">
        <button
          v-if="page.settings.showBackButton"
          type="button"
          class="bg-white py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
          @click.prevent="onBack"
        >
          {{ page.settings.backButtonLabel }}
        </button>

        <button
          :disabled="loading"
          type="submit"
          class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
          :class="{ loading: loading }"
        >
          {{ page.settings.submitButtonLabel }}
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import FormieField from "@components/FormieField.vue";

export default {
  components: {
    FormieField,
  },

  props: {
    form: {
      type: Object,
      default: () => {},
    },

    page: {
      type: Object,
      default: () => {},
    },

    pageIndex: {
      type: Number,
      default: 0,
    },

    loading: {
      type: Boolean,
      default: false,
    },

    modelValue: {
      type: Number,
      default: 0,
    },
  },

  emits: ["update:modelValue"],

  computed: {
    activePage: {
      get() {
        return this.modelValue;
      },

      set(newValue) {
        this.$emit("update:modelValue", newValue);
      },
    },

    position() {
      if (this.page.settings.buttonsPosition === "left-right") {
        return "justify-between";
      }

      if (this.page.settings.buttonsPosition === "center") {
        return "justify-center";
      }

      if (this.page.settings.buttonsPosition === "right") {
        return "justify-end";
      }

      return "";
    },
  },

  methods: {
    onBack() {
      this.activePage -= 1;
    },
  },
};
</script>
