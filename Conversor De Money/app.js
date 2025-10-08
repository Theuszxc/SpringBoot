function converter() {
    const amountInput = document.getElementById('amount').value;
    const fromCurrency = document.getElementById('fromCurrency').value;
    const toCurrency = document.getElementById('toCurrency').value;

    const amount = parseFloat(amountInput);
    if (isNaN(amount)) {
        alert("Por favor, insira um valor numérico válido.");
        return;
    }

    fetch("http://localhost:8080/api", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            from: fromCurrency,
            to: toCurrency,
            amount: amount
        })
    })
    .then(response => response.json())
    .then(data => {
        console.log("Resposta da API:", data); // útil para depurar

        if (data.error) {
            document.getElementById("resultado").innerHTML = `Erro: ${data.error}`;
            return;
        }

        const resultadoHtml = `Resultado:<br>${toCurrency}: ${data.convertedValue.toFixed(2)}`;
        document.getElementById("resultado").innerHTML = resultadoHtml;
    })
    .catch(err => {
        console.error("Erro na requisição:", err);
        alert("Erro ao realizar conversão.");
    });
}
