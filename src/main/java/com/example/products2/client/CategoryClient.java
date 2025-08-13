package com.example.products2.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "category", url = "${service.categories.url}")
public interface CategoryClient {
    @GetMapping("/api/categories/{id}")
    CategoryDTO getCategory(@PathVariable("id") Long id);
}
