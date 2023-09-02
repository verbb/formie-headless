<script>
import Pristine from "pristinejs";

import { FormQuery } from "@graphql/forms";
import { getFormMutation, getMutationVariables } from "@utils/mutations";
import {
  resetValidation,
  runValidation,
  applyServerValidation,
} from "@utils/validation";

import Alert from "@components/Alert.vue";
import FormiePage from "@components/FormiePage.vue";

export default {
  components: {
    Alert,
    FormiePage,
  },

  props: {
    handle: {
      type: String,
      required: true,
    },
  },

  data() {
    return {
      form: false,
      activePage: 0,
      error: false,
      loading: false,
      alertState: null,
      validator: null,
    };
  },

  computed: {
    stepPercentage() {
      return parseInt(
        ((this.activePage + 1) / this.form.pages.length) * 100,
        10,
      );
    },
  },

  apollo: {
    form: {
      query: FormQuery,
      variables() {
        return { handle: this.handle };
      },
      error(error) {
        this.error = error.message;
      },

      // Figure out why fragments don't work without this??
      fetchPolicy: "no-cache",
    },
  },

  methods: {
    onTabClick(index) {
      this.activePage = index;
    },

    onSubmit(e) {
      this.loading = true;
      this.alertState = false;

      // Always validate the current page only, not the entire form
      const $form = this.$refs.form;
      const $page = this.$refs[`page-${this.activePage}`].$el;

      // Setup a validator
      this.validator = new Pristine($form);

      // Clear out validation errors
      resetValidation($form);

      const isLastPage = this.activePage === this.form.pages.length - 1;
      const valid = runValidation(this.validator, $page);

      // Validate the form - for each page
      if (!valid) {
        this.loading = false;
        this.alertState = "error";

        return;
      }

      // Are we on the last page, or on a multi-step page?
      if (!isLastPage) {
        this.loading = false;

        return (this.activePage += 1);
      }

      // Prepare an object from FormData
      const formData = getMutationVariables(this.form, $form);

      // Generate a mutation string, with all the input types sorted
      const formMutation = getFormMutation(this.form);

      this.$apollo
        .mutate({
          mutation: formMutation,
          variables: formData,
        })
        .then(({ data }) => {
          this.loading = false;

          const response = data[`save_${this.handle}_Submission`];
          this.onSuccess(response);
        })
        .catch((error) => {
          this.loading = false;
          this.alertState = "error";

          // Apply server-side errors
          applyServerValidation(this.validator, $form, error);

          console.error(error);
        });
    },

    onSuccess(response) {
      if (this.form.settings.submitAction === "message") {
        this.alertState = "success";
      }

      this.$refs.form.reset();
    },
  },
};
</script>

<template>
  <div class="shadow rounded-md bg-white overflow-hidden">
    <form v-if="form" ref="form" novalidate @submit.prevent="onSubmit">
      <alert
        v-model="alertState"
        :success-text="form.settings.submitActionMessageHtml"
        :error-text="form.settings.errorMessageHtml"
      />

      <div v-if="form.settings.displayFormTitle" class="text-center">
        <h2 class="text-xl leading-6 font-semibold text-gray-900 my-4 sm:my-6">
          {{ form.title }}
        </h2>

        <hr />
      </div>

      <div
        v-if="form.settings.displayPageTabs"
        class="px-4 sm:px-6 border-b border-gray-200"
      >
        <nav class="-mb-px flex space-x-8" aria-label="Tabs">
          <a
            v-for="(page, index) in form.pages"
            :key="index"
            href="#"
            :class="
              index == activePage
                ? 'border-indigo-500 text-indigo-600 whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm'
            "
            @click.prevent="onTabClick(index)"
          >
            {{ page.name }}
          </a>
        </nav>
      </div>

      <div v-if="form.settings.displayPageProgress" class="mt-4 px-4 sm:px-6">
        <div
          class="flex h-5 overflow-hidden text-xs font-medium text-white rounded-md bg-gray-200"
        >
          <div
            class="flex flex-col justify-center text-center bg-indigo-500"
            :style="'width: ' + stepPercentage + '%'"
            role="progressbar"
            :aria-valuenow="stepPercentage"
            aria-valuemin="0"
            aria-valuemax="100"
          >
            <span class="">{{ stepPercentage }}%</span>
          </div>
        </div>
      </div>

      <formie-page
        v-for="(page, index) in form.pages"
        :key="index"
        :ref="'page-' + index"
        v-model="activePage"
        :page="page"
        :page-index="index"
        :form="form"
        :loading="loading"
      />
    </form>

    <div
      v-else-if="form === null"
      class="bg-white p-24 text-center text-red-500"
    >
      Unable to find form "{{ handle }}".
    </div>

    <div v-else class="bg-white p-24 text-center text-red-500">
      <div v-if="error" class="text-red-500">{{ error }}</div>
      <div v-else class="loading loading-lg"></div>
    </div>
  </div>
</template>
