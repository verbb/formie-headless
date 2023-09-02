<template>
  <template v-if="field.useMultipleFields">
    <fieldset :aria-labelledby="getId()" class="-mb-5">
      <legend class="block text-sm font-medium text-gray-700 mb-1">
        {{ field.label }}
      </legend>

      <field-instructions :field="field" position="fieldset-start" />

      <div
        v-for="(fields, i) in getSubFields()"
        :key="i"
        class="flex flex-wrap -mx-2"
      >
        <div
          v-for="(subField, index) in fields"
          :key="index"
          class="flex-1 px-2 mb-5"
        >
          <field-label
            :id="getId([index])"
            :field="subField"
            position="above-input"
          />

          <div v-if="index === 'prefix'">
            <select
              :id="getId([index])"
              :name="getName([index])"
              :autocomplete="autocomplete[index]"
              class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"
            >
              <option
                v-for="(option, j) in subField.options"
                :key="j"
                :value="option.value"
              >
                {{ option.label }}
              </option>
            </select>
          </div>

          <div v-else>
            <input
              v-bind="attrs(subField, [index])"
              :autocomplete="autocomplete[index]"
              type="text"
              class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
            />
          </div>

          <field-label
            :id="getId([index])"
            :field="subField"
            position="below-input"
          />
        </div>
      </div>
    </fieldset>
  </template>

  <template v-else>
    <field-label :id="getId()" :field="field" position="above-input" />

    <field-instructions :field="field" position="above-input" />

    <input
      v-bind="attrs()"
      type="text"
      class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
    />

    <field-instructions :field="field" position="below-input" />

    <field-label :id="getId()" :field="field" position="below-input" />
  </template>
</template>

<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],

  data() {
    return {
      subFields: [["prefix", "firstName", "middleName", "lastName"]],

      autocomplete: {
        prefix: "honorific-prefix",
        firstName: "given-name",
        middleName: "additional-name",
        lastName: "family-name",
      },
    };
  },
};
</script>
