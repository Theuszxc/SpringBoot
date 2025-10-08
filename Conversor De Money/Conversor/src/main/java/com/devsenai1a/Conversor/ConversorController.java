package com.devsenai1a.Conversor;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ConversorController {

    private static final double USD_TO_BRL = 5.0;
    private static final double EUR_TO_BRL = 6.0;

    @PostMapping("/api")
    public Map<String, Object> convert(@RequestBody Map<String, String> body) {
        try {
            String from = body.get("from");
            String to = body.get("to");
            double amount = Double.parseDouble(body.get("amount"));

            double amountInBRL = switch (from.toUpperCase()) {
                case "BRL" -> amount;
                case "USD" -> amount * USD_TO_BRL;
                case "EUR" -> amount * EUR_TO_BRL;
                default -> {
                    yield -1;
                }
            };

            if (amountInBRL < 0) {
                return Map.of("error", "Moeda de origem não suportada");
            }

            double convertedValue = switch (to.toUpperCase()) {
                case "BRL" -> amountInBRL;
                case "USD" -> amountInBRL / USD_TO_BRL;
                case "EUR" -> amountInBRL / EUR_TO_BRL;
                default -> {
                    yield -1;
                }
            };

            if (convertedValue < 0) {
                return Map.of("error", "Moeda de destino não suportada");
            }

            return Map.of("convertedValue", convertedValue);

        } catch (Exception e) {
            return Map.of("error", "Erro ao processar conversão: " + e.getMessage());
        }
    }
}
