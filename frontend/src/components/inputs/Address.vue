<script>
import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],

  data() {
    return {
      subFields: [
        ["address1"],
        ["address2"],
        ["address3"],
        ["city", "zip"],
        ["state", "country"],
      ],

      autocomplete: {
        address1: "address-line1",
        address2: "address-line2",
        address3: "address-line3",
        city: "address-level2",
        zip: "postal-code",
        state: "address-level1",
        country: "country",
      },
    };
  },
};
</script>

<template>
  <fieldset :aria-labelledby="getId()" class="-mb-5">
    <legend class="block text-sm font-medium text-gray-700 mb-1">
      {{ field.label }}
    </legend>

    <FieldInstructions :field="field" position="fieldset-start" />

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
        <FieldLabel
          :id="getId([index])"
          :field="subField"
          position="above-input"
        />

        <div v-if="index === 'country'">
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

        <FieldLabel
          :id="getId([index])"
          :field="subField"
          position="below-input"
        />
      </div>
    </div>
  </fieldset>
</template>
