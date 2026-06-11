package br.com.rar.taskmanager.model.commons;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

@MappedSuperclass
public abstract class Pessoa implements IPessoa {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nome;
	private String sobrenome;
	private String email;
	private String celular;
	
	@Column(name = "dt_cadastro", nullable = false, updatable = false)
	private LocalDateTime dtCadastro;
	
	@Column(name = "dt_alteracao", nullable = false, updatable = false)
	private LocalDateTime dtAlteracao;
	
	private boolean ativa;
	
	@PrePersist
    protected void onPrePersist() {
        this.dtCadastro = LocalDateTime.now();
        this.dtAlteracao = LocalDateTime.now(); 
    }

    @PreUpdate
    protected void onPreUpdate() {
        this.dtAlteracao = LocalDateTime.now();
    }
	
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
	public LocalDateTime getDtCadastro() {
		return dtCadastro;
	}
	public void setDtCadastro(LocalDateTime dtCadastro) {
		this.dtCadastro = dtCadastro;
	}
	@Override
	public LocalDateTime getDtAlteracao() {
		return dtAlteracao;
	}
	@Override
	public void setDtAlteracao(LocalDateTime dtAlteracao) {
		this.dtAlteracao = dtAlteracao;
	}
	@Override
	public void setAtiva(boolean ativa) {
		this.ativa = ativa;
	}
	
}
