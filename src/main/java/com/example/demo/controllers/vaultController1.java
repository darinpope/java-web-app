package com.example.demo.controllers;

import com.example.demo.classes.SecretRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.vault.core.VaultKeyValueOperations;
import org.springframework.vault.core.VaultTemplate;
import org.springframework.vault.support.VaultResponse;

@RestController
public class vaultController1 {

    @Autowired
    private final VaultTemplate vaultTemplate;

    @Autowired
    public vaultController1(VaultTemplate vaultTemplate) {
        this.vaultTemplate = vaultTemplate;
    }

    @PostMapping("/secrets")
    public ResponseEntity<String> saveSecret(@RequestBody SecretRequest secretRequest) {
        if (StringUtils.isEmpty(secretRequest.getKey()) || StringUtils.isEmpty(secretRequest.getValue())) {
            return ResponseEntity.badRequest().body("Key and value must not be empty");
        }

        VaultKeyValueOperations vaultKeyValueOperations = vaultTemplate.opsForKeyValue("vault-secrets/key", enum(KV_1);

        vaultKeyValueOperations.put(secretRequest.getKey(), secretRequest.getValue());

        return ResponseEntity.status(HttpStatus.CREATED).body("Secret saved successfully");
    }
}
