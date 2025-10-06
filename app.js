document.getElementById('clcForm').addEventListener('submit', async function (e) {
    e.preventDefault();

    const num1 = parseFloat(document.getElementById('num1').value);
    const num2 = parseFloat(document.getElementById('num2').value);
    const operacao = document.getElementById('operacao').value;

    const erroDiv = document.getElementById('erro');
    const resultadoDiv = document.getElementById('resultado');

    erroDiv.textContent = '';
    resultadoDiv.textContent = '';

    try {
        const response = await fetch('http://localhost:8080/calcular', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ num1, num2, operacao }),
        });

        if (!response.ok) throw new Error('Erro na requisição');

        const data = await response.json();

        if (data.erro) {
            erroDiv.textContent = data.erro;
        } else {
            resultadoDiv.textContent = 'Resultado: ' + data.resultado;
        }
    } catch (error) {
        erroDiv.textContent = 'Erro: ' + error.message;
    }
});
