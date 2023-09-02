# Formie Headless Demo
This is a demo of a GraphQL, headless project using [Craft CMS](https://craftcms.com), [Vue.js 3.0](https://vuejs.org/) and [Formie](https://verbb.io/craft-plugins/formie). This repository comes in two parts, the Craft CMS install and the front-end headless project. 

## Demo
Take the demo for a spin! 
- [Contact Form](https://formie-headless.verbb.io/?form=contactForm)
- [All Fields](https://formie-headless.verbb.io/?form=fieldsDemo)

<h2></h2>

<img src="https://github.com/verbb/formie-headless/raw/master/screenshot.png">

## Project summary
We're using Vue for our front-end, but the techniques employed here can be utilised on any number of GraphQL-based projects. Even if you're not using Vue, we'd encourage you to spin up the project as-is to see it all working, and you can pick-and-choose functionality to use in your own applications.

- [DDEV](https://ddev.com/) is used for local development.
- [Vite.js](https://vitejs.dev/) is used for the build system as per [Vite.js Next Generation Frontend Tooling + Craft CMS](https://nystudio107.com/blog/using-vite-js-next-generation-frontend-tooling-with-craft-cms)
- [Vue.js 3](https://vuejs.org/) is used for the interactive bits.
- [Tailwind CSS](https://tailwindcss.com/).
- [ESlint](https://eslint.org/) to keep JS lookin' good!
- [Prettier](https://prettier.io/) to keep the code correctly and consistently formatted.
- [Vue Apollo](https://apollo.vuejs.org/) Easy GraphQL handling using Apollo for queries and mutations.
- [Pristine.js](https://pristine.js.org/) Simple form validation.

## Setting up Craft
This repository contains the Craft CMS project files in the main root folder. Little to no changes have been made from the [craftcms/craft](https://github.com/craftcms/craft) project.

- Clone this repository to your local machine.
- Ensure you have [DDEV](https://ddev.com/) installed.
- Run `ddev start` at the root of the project.
- Run `ddev composer install` at the root of the project.
- Ensure you setup your `.env` file as you normally would.
- If this is your first time running the project, then run `ddev craft setup/security-key` to generate a security key, and also run `ddev import-db < database.sql` to import the data.
- Finally, open the browser and go to [https://formie-headless.ddev.site/admin](https://formie-headless.ddev.site/admin).

The CP login credentials are initially set as follows:

Login: `formie` \
Password: `formie`

You can also use your own Craft install - this is a headless demo after all! You'll just want to ensure Formie and Craft are enabled for GraphQL querying and mutations.

## Setting up Vite
The front-end Vite project is contained in `frontend`. The two projects are completely detatched (headless), but kept in the single repository for ease. Vite provides a super-fast dev server for local development. We've intentionally kept the demo as minimal as possible, but it's a full-featured implementation of Formie functionality.

### `.env` file
There's two env settings you'll need to configure.

```
VITE_GQL_URL="https://formie-headless.ddev.site/api"
```

This is the full URL to your GraphQL endpoint. We'll use this to query forms and run mutations on submissions.

```
VITE_DEFAULT_FORM="contactForm"
```

The handle of the form you would like to show. You can also pass in a query param `http://formie-headless.ddev.site:3000/?form=formHandle` to spin up an example of any form.

### Dev server
- Open a terminal, then run `ddev exec "cd frontend && npm install"` at the root of the project.
- Start up the Vite dev server by typing `ddev exec "cd frontend && npm run dev"`.
- Navigate to `https://formie-headless.ddev.site:3000` to see the demo.

You should see the "Contact Form"!

### Vue project
We've used Vue for this demo, but the concepts used here could be used in any framework. Be sure to check out the GraphQL sections below for the "good stuff".

Otherwise, the Vue components used in this demo are fully-featured, so there are some complexities that you might not need for your site. For example, being able to handle different label and instruction locations.

#### Component summary
- `App` - The wrapper component that holds a form.
- `FormieForm` - The form component, which handles all GraphQL handling, overall form-level functionality
- `FormiePage` - Each page in the form uses this component. Pages contain back/next page buttons.
- `FormieField` - Each field wraps another component in `inputs/` to keep things modular.
- `inputs/` - Each input type has its own component file, as each require different implementations.
- `mixins/FieldMixin` - Each field uses this mixin, and contains common functionality.

#### Validation
We decided not to include a Vue-based validation framework, to help not tie this project too deeply to Vue - in terms of functionality. [VeeValidate](https://vee-validate.logaretm.com/v4/) and [Vuelidate](https://vuelidate.js.org/) are both quite opinionated when it comes to structing components. We thought this would get in the way of understanding this demo project, and at the same time requires understanding of those frameworks to understand the form/field structure.

As such, our approach is very light-on, using [Pristine.js](https://pristine.js.org/) which is entirely framework-agnostic. Of course, feel free to use your own validation options.

### GraphQL queries
Formie supports querying forms via [GraphQL queries](https://verbb.io/craft-plugins/formie/docs/developers/graphql), including form settings, pages, and of course fields. From this endpoint, you cna fetch everything you need about a form for rendering it in your app.

Have a look at the [graphql/forms.js](https://github.com/verbb/formie-headless/blob/master/frontend/src/graphql/forms.js) file, which contains the GraphQL query we use. We've split each field into a GraphQL fragment to easily re-use.

We then use Apollo to [fetch the data](https://github.com/verbb/formie-headless/blob/c2147bfce49f9d8df3ddfd3f9270659d52a4b87a/frontend/src/components/FormieForm.vue#L92-L105) from this query, given a handle for the form.

### GraphQL mutations
Formie supports creating submissions via [GraphQL mutations](https://verbb.io/craft-plugins/formie/docs/developers/graphql). A mutation looks something like:

```
// Query
mutation saveSubmission($yourName: String) {
    save_contactForm_Submission(yourName: $yourName) {
        id
    }
}

// Query Variables
{
    "yourName": "Peter Sherman"
}
```

Here, you define the query which includes all field you want to create content for, and importantly their type. As such, this acts like a schema for the data you want to send. This also needs to be tailored to the handle you're using - `contactForm` in this case. Then, you'll want to supply variables which contain the content.

While the above example seems simple, things quickly get complicated for large forms, or where you want clients to be able to create their own forms (rightly so!). You'd then need to setup a schema for every field you want to use.

To address this, we can use the data fetched for each field in our query to construct this schema string completely dynamically, using a few helper function. Have a look at the [utils/mutations.js](https://github.com/verbb/formie-headless/blob/master/frontend/src/utils/mutations.js) file for how we construct this. The `getFormMutation()` will return the schema above, setup and ready to go - given a form object (received from the GraphQL query).

Also see how we construct the GraphQL [schema and variables](https://github.com/verbb/formie-headless/blob/c2147bfce49f9d8df3ddfd3f9270659d52a4b87a/frontend/src/components/FormieForm.vue#L144-L167) to send to the server.

#### Captchas
A little extra work is required for captchas to be supported correctly. Ensure you add the following to your GQL form query to fetch tokens generated server-side.

```
{
    form (handle: "contactForm") {
        ...

        captchas {
            handle
            name
            value
        }
    }
}
```

Here, we're fetching 3 vital bits of information, which is the `handle` of the Captcha integration, the `name` of the session variable used to compare the tokens between client and server, and the `value` of the token.

To authenticate your enabled Captchas correctly, you'll need to include these in your mutation, sent to the server.

```
// Query
mutation saveSubmission($yourName:contactForm_yourName_FormieNameInput $javascriptCaptcha: FormieCaptchaInput) {
    save_contactForm_Submission(yourName: $yourName, javascriptCaptcha: $javascriptCaptcha) {
        title
    }
}

// Query Variables
{
    "yourName": {
        "firstName": "Peter",
        "lastName": "Sherman"
    },
    "javascriptCaptcha": {
        "name": "__JSCHK_8403842",
        "value": "1234"
    }
}
```

The `javascriptCaptcha` param above is using the `handle`, `name` and `value` fetching during our initial query of the form. Our helper functions `getMutationVariables()` and `getFormMutation()` will add the correct typing to the mutation, and inject them into the variables sent alongside the mutation. But you can of course construct the mutation and variables manually as per the above if you don't use our helpers.

However, you'll also need to setup your Craft install to handle a persistent cookie session. This is because these captchas generate a unique value when the form is rendered (or in the case of GraphQL - when queried), which are then used to compare when the form is submitted. These values are stored server-side in a session, however this is not typically persisted for most requests due to CORS. Fortunately, this can be configurable through a number of different settings.

First, we'll need to modify our client-side code to include `credentials`. This is to ensure your front-end code persists cookies with the server. For Apollo (which this demo uses) you can use:

```js
const apolloProvider = createApolloProvider({
    defaultClient: new ApolloClient({
        // ...

        // Enable sending cookies over cross-origin requests
        credentials: 'include',
    }),
});
```

You can also use `credentials: 'same-origin'` if your backend server is the same domain, or `credentials: 'include'` if your backend is a different domain.

Next, you'll need to configure your server (if you haven't already) to grant access via `Access-Control-Allow-Origin`. Note that this **must** be a domain, and not the wildcard `*`, as we are enforcing credentials in order to maintain a cookie session.

For Apache, this might look like the below. Of course, changing the origin to match your headless front-end site:

```
Header add Access-Control-Allow-Origin "https://my-headless-site.test"
Header add Access-Control-Allow-Credentials "true"
```

Lastly, we need to add the following to your `general.php` file:

```php
return [
    'sameSiteCookieValue' => 'Lax',

    'allowedGraphqlOrigins' => [
        'https://my-headless-site.test',
    ],
];
```

Here, we are setting the [sameSiteCookieValue](https://craftcms.com/docs/3.x/config/config-settings.html#samesitecookievalue) to `Lax` (further reading [here](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie/SameSite)) and setting the [allowedGraphqlOrigins](https://craftcms.com/docs/3.x/config/config-settings.html#allowedgraphqlorigins) to our headless front-end site (essentially setting `Access-Control-Allow-Origin`)

Once these have been done, maintaining a session between client and server should be possible. As such, captchas should be evaluated correctly.


##### reCAPTCHA & hCaptcha
reCAPTCHA support is slightly more involved, as you'll need to fetch the token from reCAPTCHA first, then attach it to your mutation. The same applies for hCaptcha. How you implement this is up to you, but typically in your form's submit handler, you'll have:

```js
import { load } from 'recaptcha-v3';

upsert(array, element) {
    const i = array.findIndex((el) => { return el.handle === element.handle; });

    if (i > -1) {
        array[i] = element;
    } else {
        array.push(element);
    }
},

onSubmit(e) {
    // Load reCAPTCHA and request a token. Then attach it to our mutation
    load(import.meta.env.VITE_RECAPTCHA_KEY).then((recaptcha) => {
        recaptcha.execute().then((token) => {
            // Add it to the form variables so it can be prepped. Be sure to check if it already
            // included in the form data (submitting multiple times in a single request)
            this.upsert(this.form.captchas, {
                handle: 'recaptchaCaptcha',
                name: 'g-recaptcha-response',
                value: token,
            });

            const formData = getMutationVariables(this.form, $form);
            const formMutation = getFormMutation(this.form);

            // Construct the mutation as normal
            this.$apollo.mutate({
                // ...
            });
        });
    });
},
```

Where we first fetch the token from reCAPTCHA with our site key `.env` variable, and add it manually to `form.captchas`. Our helper functions `getMutationVariables()` and `getFormMutation()` will add the correct typing to the mutation, and inject them into the variables sent alongside the mutation. 

> We're also using an `upsert()` function to help when adding this captcha token to our forms object - which is completely optional. This just helps when submitting the form multiple times, and the captcha token for reCAPTCHA already exists (from the previous request). The `upsert()` function will unsure it's updated.

You can also use the framework-agnostic package to help, as we have done using `npm install recaptcha-v3`.


## Credits & Thanks
Thanks to [Dave Stockley / magicspon](https://github.com/magicspon) for their work on the mutations generator.

<h2></h2>

<a href="https://verbb.io" target="_blank">
  <img width="100" src="https://verbb.io/assets/img/verbb-pill.svg">
</a>
