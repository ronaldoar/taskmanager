
$(document).ready(function() {
    // 1. Seleciona todos os inputs obrigatórios e o botão
	const $campos 		 = $('.cp-obrigatorio');
	const $botao  		 = $('#btnEnviar');

    // 2. Função que verifica se todos os campos estão preenchidos
    function verificarCampos() {
        let todosPreenchidos = true;

        $campos.each(function() {
            // .trim() remove espaços em branco no início e no fim
            if ($(this).val().trim() === '') {
                todosPreenchidos = false;
                return false; // Interrompe o loop .each() assim que encontrar um vazio
            }
        });

        // 3. Habilita ou desabilita o botão com base na verificação
        if (todosPreenchidos) {
            $botao.prop('disabled', false); // Habilita
        } else {
            $botao.prop('disabled', true);  // Desabilita
        }
    }

    // 4. Executa a verificação inicialmente (por segurança)
    verificarCampos();

    // 5. Dispara a verificação a cada vez que o usuário digita algo nos campos
    $campos.on('input', verificarCampos);
});