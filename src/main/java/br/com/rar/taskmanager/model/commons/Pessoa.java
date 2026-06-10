package br.com.rar.taskmanager.model.commons;

public abstract class Pessoa implements IPessoa {
	
	private Long id;
	private String nome;
	private String sobrenome;
	private String email;
	private String celular;
	private boolean ativa;
	
	@Override
	public Long getId() {
		return id;
	}
	@Override
	public void setId(Long id) {
		this.id = id;
	}
	@Override
	public String getNome() {
		return nome;
	}
	@Override
	public void setNome(String nome) {
		this.nome = nome;
	}
	@Override
	public String getSobrenome() {
		return sobrenome;
	}
	@Override
	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}
	@Override
	public String getEmail() {
		return email;
	}
	@Override
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String getCelular() {
		return celular;
	}
	@Override
	public void setCelular(String celular) {
		this.celular = celular;
	}
	@Override
	public boolean isAtiva() {
		return ativa;
	}
	@Override
	public void setAtiva(boolean ativa) {
		this.ativa = ativa;
	}
	
}
