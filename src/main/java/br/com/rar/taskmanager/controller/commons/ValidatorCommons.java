package br.com.rar.taskmanager.controller.commons;

import br.com.rar.taskmanager.util.StringUtil;

public class ValidatorCommons {
	
	private ValidatorCommons() {}
	
	public static void validar(String ...params) {
		for(String p : params) {
			if(StringUtil.isNull(p))throw new IllegalArgumentException("Todos os campos devem ser obrigatórios.");
		}
	}
	
	public static void validarSenhas(String senha, String confirmSenha) {
		if(!senha.equals(confirmSenha))throw new IllegalArgumentException("As senhas não coincidem.");
	}
}
