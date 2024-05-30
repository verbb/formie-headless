import { camelCase } from "lodash-es";

import { getId, getName, attributesTable } from "@utils/helpers";

import FieldInstructions from "@components/inputs/includes/FieldInstructions.vue";
import FieldLabel from "@components/inputs/includes/FieldLabel.vue";

export default {
  components: {
    FieldInstructions,
    FieldLabel,
  },

  props: {
    field: {
      type: Object,
      default: () => {},
    },

    namespace: {
      type: Array,
      default: () => {
        return [];
      },
    },

    namespaceSuffix: {
      type: Array,
      default: () => {
        return [];
      },
    },
  },

  data() {
    return {
      subFields: [],
    };
  },

  methods: {
    attrs(field = null, handles = []) {
      if (field === null) {
        field = this.field;
      }

      return {
        id: this.getId(handles),
        name: this.getName(handles),
        required: field.required,
        placeholder: field.placeholder,
        value: field.defaultValue,
        ...attributesTable(field.inputAttributes),
      };
    },

    getId(handles = []) {
      const parts = [
        ...this.namespace,
        this.field.handle,
        ...handles,
        ...this.namespaceSuffix,
      ];

      return getId(parts);
    },

    getName(handles = []) {
      const parts = [
        ...this.namespace,
        this.field.handle,
        ...handles,
        ...this.namespaceSuffix,
      ];

      return getName(parts);
    },

    getSubFields() {
      const enabledSubFields = [];

      this.subFields.forEach((subFields, groupIndex) => {
        subFields.forEach((subField) => {
          if (this.field[`${subField}Enabled`]) {
            const subFieldOptions = {};

            Object.keys(this.field).forEach((key) => {
              if (key.startsWith(subField)) {
                const newKey = camelCase(key.replace(subField, ""));

                subFieldOptions[newKey] = this.field[key];
              }
            });

            if (!enabledSubFields[groupIndex]) {
              enabledSubFields[groupIndex] = {};
            }

            enabledSubFields[groupIndex][subField] = subFieldOptions;
          }
        });
      });

      return enabledSubFields;
    },
  },
};
