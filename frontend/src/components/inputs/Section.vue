<template>
    <hr
        :style="[
            field.borderStyle ? `border-top-style: ${field.borderStyle}` : null,
            field.borderWidth ? `border-top-width: ${field.borderWidth}px` : null,
            field.borderColor ? `border-top-color: ${field.borderColor}` : null,
        ]"
    >
</template>

<script>
import FieldMixin from '@mixins/FieldMixin';

export default {
    mixins: [FieldMixin],
};

</script>
