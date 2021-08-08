import Pristine from 'pristinejs';

export const resetValidation = (el) => {
    // Clear out all errors for the form
    el.querySelectorAll('[data-formie-input-error]').forEach((input) => {
        input.removeAttribute('data-formie-input-error');
    });

    el.querySelectorAll('[data-formie-error-text]').forEach((input) => {
        input.remove();
    });
};

export const showValidation = (pristine) => {
    const appliedErrors = [];

    // There's some errors here with Pristine when calling `getErrors()`
    // https://github.com/sha256/Pristine/pull/48
    pristine.fields.forEach((field) => {
        if (!field.errors) {
            field.errors = [];
        }
    });

    pristine.getErrors().forEach(({ input, errors }) => {
        // Add errors to the inputs
        input.setAttribute('data-formie-input-error', true);

        const inputName = input.getAttribute('name');
        const tagName = input.tagName.toLowerCase();
        const inputType = input.getAttribute('type') ? input.getAttribute('type').toLowerCase() : '';

        // Prevent errors applying multiple times
        if (appliedErrors.includes(inputName)) {
            return;
        }

        // Add the error message to the input
        const errorTextElement = document.createElement('div');
        errorTextElement.setAttribute('data-formie-error-text', true);
        errorTextElement.innerHTML = errors.join('<br/>');

        let errorTextParent = input.parentElement;

        // Handle grouped fields like radio and checkboxes
        if (inputType === 'radio' || inputType === 'checkbox') {
            errorTextParent = errorTextParent.parentElement;
        }

        errorTextParent.appendChild(errorTextElement);

        // Save so we never have multiple errors per input
        appliedErrors.push(inputName);
    });
};

export const runValidation = (pristine, $page) => {
    // Validate only the inputs on a given page
    const inputs = $page.querySelectorAll('input:not([type^=hidden]):not([type^=submit]), select, textarea');

    // Validate the inputs
    const valid = pristine.validate(inputs);

    // Show validation info - due to it being Vue, doesn't happen automatically
    showValidation(pristine);

    return valid;
};

export const applyServerValidation = (pristine, el, error) => {
    let errors = {};

    try {
        errors = JSON.parse(error.message);
    } catch (e) {
        //
    }

    // Load in any errors from GQL into Pristine to show
    Object.entries(errors).forEach(([key, value]) => {
        const input = el.querySelector(`[name="${key}"]`);

        if (input) {
            pristine.addError(input, value);
        }
    });

    // Show errors, need to manually trigger this due to Vue incompatibility
    showValidation(pristine);
};
