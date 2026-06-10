package br.com.rar.taskmanager.model.commons;

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
}
