function limpaFormulario() {
  document.getElementById('rua').value = "";
  document.getElementById('bairro').value = "";
  document.getElementById('cidade').value = "";
  document.getElementById('uf').value = "";
  document.getElementById('ibge').value = "";
  document.getElementById('ddd').value = "";
  document.getElementById('siafi').value = "";
}

function pesquisacep(valor) {
  var cep = valor.replace(/\D/g, ''); // Remove caracteres não numéricos

  if (cep !== "") {
    var validaCep = /^[0-9]{8}$/;

    if (validaCep.test(cep)) {
      // Preenche os campos com "..." enquanto carrega
      document.getElementById('rua').value = "...";
      document.getElementById('bairro').value = "...";
      document.getElementById('cidade').value = "...";
      document.getElementById('uf').value = "...";
      document.getElementById('ibge').value = "...";
      document.getElementById('ddd').value = "...";
      document.getElementById('siafi').value = "...";

      fetch(`https://viacep.com.br/ws/${cep}/json/`)
        .then(response => {
          if (!response.ok) throw new Error('Erro na requisição');
          return response.json();
        })
        .then(data => {
          if (!data.erro) {
            document.getElementById('rua').value = data.logradouro;
            document.getElementById('bairro').value = data.bairro;
            document.getElementById('cidade').value = data.localidade;
            document.getElementById('uf').value = data.uf;
            document.getElementById('ibge').value = data.ibge;
            document.getElementById('ddd').value = data.ddd;
            document.getElementById('siafi').value = data.siafi;
          } else {
            limpaFormulario();
            alert("CEP não encontrado!");
          }
        })
        .catch(error => {
          limpaFormulario();
          alert("Erro ao buscar o CEP: " + error.message);
        });
    } else {
      limpaFormulario();
      alert("Formato de CEP inválido!");
    }
  } else {
    limpaFormulario();
  }
}
