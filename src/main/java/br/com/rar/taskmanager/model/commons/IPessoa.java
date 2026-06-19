package br.com.rar.taskmanager.model.commons;

import java.time.LocalDateTime;

public interface IPessoa {
	
	public Long getId();
	public void setId(Long id);
	
	public String getNome();
	public void setNome(String nome);
	
	public String getSobrenome();
	public void setSobrenome(String sobrenome);
	
	public String getEmail();
	public void setEmail(String email);
	
	public String getCelular();
	public void setCelular(String celular);
	
	public boolean isAtiva();
	public void setAtiva(boolean ativa);
	
	public LocalDateTime getDtCadastro();
	public void setDtCadastro(LocalDateTime dtCadastro);
	
	public LocalDateTime getDtAlteracao();
	public void setDtAlteracao(LocalDateTime dtAlteracao);
}
