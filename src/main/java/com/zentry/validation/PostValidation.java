package com.zentry.validation;

import com.zentry.Models.NewsPost;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class PostValidation implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return NewsPost.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "title", "field.required");
        ValidationUtils.rejectIfEmpty(errors, "description", "field.required");
    }
}
