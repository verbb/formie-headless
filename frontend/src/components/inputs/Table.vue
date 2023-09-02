<template>
  <fieldset :aria-labelledby="getId()" class="contents">
    <legend class="block text-sm font-medium text-gray-700 mb-1">
      {{ field.label }}
    </legend>

    <field-instructions :field="field" position="above-input" />

    <div class="flex flex-col">
      <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
          <div
            class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg"
          >
            <table ref="table" class="min-w-full divide-y divide-gray-200">
              <thead class="bg-gray-50">
                <tr>
                  <th
                    v-for="(column, cIndex) in field.columns"
                    :key="cIndex"
                    scope="col"
                    class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                  >
                    {{ column.heading }}
                  </th>

                  <th scope="col" class="relative px-6 py-3">
                    <span class="sr-only">Delete</span>
                  </th>
                </tr>
              </thead>

              <tbody class="bg-white divide-y divide-gray-200">
                <tr v-for="(row, rIndex) in rows" :key="row.__id">
                  <td
                    v-for="(column, cIndex) in field.columns"
                    :key="cIndex"
                    class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"
                  >
                    <div v-if="column.type === 'checkbox'">
                      <input
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        type="hidden"
                        aria-checked="false"
                        aria-hidden="true"
                      />

                      <input
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        type="checkbox"
                        value="1"
                        class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300 rounded"
                      />

                      <label :for="getId([rIndex, cIndex])">
                        &nbsp;<span class="sr-only">{{ column.heading }}</span>
                      </label>
                    </div>

                    <div v-else-if="column.type === 'color'">
                      <input
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        type="color"
                        value=""
                        class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                      />
                    </div>

                    <div v-else-if="column.type === 'date'">
                      <input
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        type="date"
                        value=""
                        class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                      />
                    </div>

                    <div v-else-if="column.type === 'select'">
                      <select
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"
                      >
                        <option
                          v-for="(option, i) in column.options"
                          :key="i"
                          :value="option.value"
                        >
                          {{ option.label }}
                        </option>
                      </select>
                    </div>

                    <div v-else-if="column.type === 'email'">
                      <input
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        type="email"
                        value=""
                        class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                      />
                    </div>

                    <div v-else-if="column.type === 'heading'"></div>

                    <div v-else-if="column.type === 'multiline'">
                      <textarea
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        class="max-w-lg shadow-sm block w-full focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border border-gray-300 rounded-md"
                      ></textarea>
                    </div>

                    <div v-else-if="column.type === 'number'">
                      <input
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        type="number"
                        value=""
                        class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                      />
                    </div>

                    <div v-else-if="column.type === 'time'">
                      <input
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        type="time"
                        value=""
                        class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                      />
                    </div>

                    <div v-else-if="column.type === 'url'">
                      <input
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        type="url"
                        value=""
                        class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                      />
                    </div>

                    <div v-else>
                      <input
                        :id="getId([rIndex, cIndex])"
                        :name="getName([rIndex, cIndex])"
                        type="text"
                        value=""
                        class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                      />
                    </div>
                  </td>

                  <td
                    class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium"
                  >
                    <a
                      href="#"
                      class="text-indigo-600 hover:text-indigo-900"
                      @click.prevent="onDelete(rIndex)"
                      >Delete</a
                    >
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <button
      v-if="!field.static"
      type="button"
      class="bg-white py-2 px-4 mt-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
      @click.prevent="onAdd"
    >
      {{ field.addRowLabel }}
    </button>

    <field-instructions :field="field" position="below-input" />
  </fieldset>
</template>

<script>
import { uniqueId } from "lodash-es";

import FieldMixin from "@mixins/FieldMixin";

export default {
  mixins: [FieldMixin],

  data() {
    return {
      rows: [],
    };
  },

  methods: {
    onAdd() {
      this.rows.push({
        __id: uniqueId(),
      });
    },

    onDelete(rIndex) {
      this.rows.splice(rIndex, 1);
    },
  },
};
</script>
