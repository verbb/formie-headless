import gql from 'graphql-tag';

export const FieldFragment = gql`
    fragment FieldFragment on FieldInterface {
        id
        name
        label: name
        handle
        instructions
        required
        type
        displayName
        typeName
        inputTypeName
        limit
        limitType
        limitAmount
        placeholder
        errorMessage
        labelPosition
        instructionsPosition
        cssClasses
        enableConditions
        conditions
        enableContentEncryption
        visibility

        containerAttributes {
            label
            value
        }

        inputAttributes {
            label
            value
        }

        ... on Field_Address {
            address1Label
            address1Enabled
            address1Hidden
            address1Required
            address1Collapsed
            address1Placeholder
            address1PrePopulate
            address1DefaultValue
            address1ErrorMessage

            address2Label
            address2Enabled
            address2Hidden
            address2Required
            address2Collapsed
            address2Placeholder
            address2PrePopulate
            address2DefaultValue
            address2ErrorMessage

            address3Label
            address3Enabled
            address3Hidden
            address3Required
            address3Collapsed
            address3Placeholder
            address3PrePopulate
            address3DefaultValue
            address3ErrorMessage

            cityLabel
            cityEnabled
            cityHidden
            cityRequired
            cityCollapsed
            cityPlaceholder
            cityPrePopulate
            cityDefaultValue
            cityErrorMessage

            stateLabel
            stateEnabled
            stateHidden
            stateRequired
            stateCollapsed
            statePlaceholder
            statePrePopulate
            stateDefaultValue
            stateErrorMessage

            zipLabel
            zipEnabled
            zipHidden
            zipRequired
            zipCollapsed
            zipPlaceholder
            zipPrePopulate
            zipDefaultValue
            zipErrorMessage

            countryLabel
            countryEnabled
            countryHidden
            countryRequired
            countryCollapsed
            countryPlaceholder
            countryPrePopulate
            countryDefaultValue
            countryErrorMessage

            countryOptions {
                label
                value
            }
        }

        ... on Field_Agree {
            defaultState
            checkedValue
            uncheckedValue
            descriptionHtml
        }

        ... on Field_Categories {
            displayType

            categories {
                id
                title
            }
        }

        ... on Field_Checkboxes {
            defaultValue
            layout
            toggleCheckbox
            toggleCheckboxLabel

            options {
                label
                value
            }
        }

        ... on Field_Date {
            dateFormat
            timeFormat
            displayType
            includeTime
            timeLabel
            defaultOption
            dayLabel
            dayPlaceholder
            monthLabel
            monthPlaceholder
            yearLabel
            yearPlaceholder
            hourLabel
            hourPlaceholder
            minuteLabel
            minutePlaceholder
            secondLabel
            secondPlaceholder
            ampmLabel
            ampmPlaceholder
            useDatePicker
            minDate
            maxDate
            subfieldLabelPosition
            defaultDate
        }

        ... on Field_Dropdown {
            multiple
            defaultValue

            options {
                label
                value
            }
        }

        ... on Field_Email {
            defaultValue
        }

        ... on Field_Entries {
            displayType

            entries {
                id
                title
            }
        }

        ... on Field_FileUpload {
            defaultValue
            uploadLocationSource
            sizeMinLimit
            sizeLimit
            allowedKinds
            limitFiles
            source
            labelSource
            selectionLabel
        }

        ... on Field_Heading {
            headingSize
        }

        ... on Field_Hidden {
            defaultValue
            defaultOption
            queryParameter
            cookieName
        }

        ... on Field_Html {
            htmlContent
        }

        ... on Field_MultiLineText {
            defaultValue
        }

        ... on Field_Name {
            useMultipleFields

            prefixLabel
            prefixEnabled
            prefixRequired
            prefixCollapsed
            prefixPlaceholder
            prefixPrePopulate
            prefixDefaultValue
            prefixErrorMessage

            prefixOptions {
                label
                value
            }

            firstNameLabel
            firstNameEnabled
            firstNameRequired
            firstNameCollapsed
            firstNamePlaceholder
            firstNamePrePopulate
            firstNameDefaultValue
            firstNameErrorMessage

            middleNameLabel
            middleNameEnabled
            middleNameRequired
            middleNameCollapsed
            middleNamePlaceholder
            middleNamePrePopulate
            middleNameDefaultValue
            middleNameErrorMessage

            lastNameLabel
            lastNameEnabled
            lastNameRequired
            lastNameCollapsed
            lastNamePlaceholder
            lastNamePrePopulate
            lastNameDefaultValue
            lastNameErrorMessage
        }

        ... on Field_Number {
            min
            max
        }

        ... on Field_Phone {
            defaultValue
            countryEnabled
            countryDefaultValue
            countryShowDialCode

            countryOptions {
                label
                value
            }
        }

        ... on Field_Radio {
            layout
          
            options {
                label
                value
            }
        }

        ... on Field_Recipients {
            displayType
            defaultValue
          
            options {
                label
                value
            }
        }

        ... on Field_Section {
            borderStyle
            borderWidth
            borderColor
        }

        ... on Field_SingleLineText {
            defaultValue
        }

        ... on Field_Table {
            static
            addRowLabel
            minRows
            maxRows
          
            columns {
                heading
                handle
                type
            }
        }

        ... on Field_Tags {
            displayType

            tags {
                id
                title
            }
        }

        ... on Field_Users {
            displayType

            users {
                id
                fullName
            }
        }
    }
`;

export const FormFragment = gql`
    ${FieldFragment}

    fragment FormFragment on FormInterface {
        id
        title
        handle
        siteId

        csrfToken {
            name
            value
        }

        captchas {
            handle
            name
            value
        }

        settings {
            displayFormTitle
            displayPageTabs
            displayCurrentPageTitle
            displayPageProgress
            submitMethod
            submitAction
            submitActionTab
            submitActionUrl
            submitActionFormHide
            submitActionMessageHtml
            submitActionMessageTimeout
            redirectUrl
            errorMessageHtml
            loadingIndicator
            loadingIndicatorText
            validationOnSubmit
            validationOnFocus
            defaultLabelPosition
            defaultInstructionsPosition
            progressPosition

            integrations {
                settings
            }

            redirectEntry {
                id
                uri
                slug
                sectionHandle
            }
        }

        pages {
            name
            id

            settings {
                submitButtonLabel
                backButtonLabel
                showBackButton
                buttonsPosition
            }

            rows {
                fields {
                    ...FieldFragment

                    ... on Field_Repeater {
                        fields {
                            ...FieldFragment
                        }
                    }

                    ... on Field_Group {
                        fields {
                            ...FieldFragment
                        }
                    }
                }
            }
        }
    }
`;

export const FormQuery = gql`
    ${FormFragment}

    query($handle: [String]) {
        form: formieForm(handle: $handle) {
            ...FormFragment
        }
    }
`;
