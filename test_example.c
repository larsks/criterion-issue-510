#include <stdio.h>
#include <criterion/criterion.h>
#include <criterion/parameterized.h>

typedef struct {
    char *input;
} paramspec;

TestSuite(Example);

ParameterizedTestParameters(Example, test_example) {
    static paramspec params[] = {
        {"this is a test"},
    };

    size_t nb_params = sizeof (params) / sizeof (paramspec);
    return cr_make_param_array(paramspec, params, nb_params);
}

ParameterizedTest(paramspec *param, Example, test_example) {
    printf("input value is: %s\n", param->input);
}
