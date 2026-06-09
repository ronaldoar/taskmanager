package br.com.rar.taskmanager.model.commons;

import java.time.LocalDateTime;

public abstract class Cartao implements ICartao {
	
	private Long id;
	private String titulo;
	private String desc;
	private CartaoStatus status;
	private LocalDateTime dtInicio;
	private LocalDateTime dtFim;
	
	@Override
	public Long getId() {
		return id;
	}
	@Override
	public void setId(Long id) {
		this.id = id;
	}
	@Override
	public String getTitulo() {
		return titulo;
	}
	@Override
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	@Override
	public String getDesc() {
		return desc;
	}
	@Override
	public void setDesc(String desc) {
		this.desc = desc;
	}
	@Override
	public CartaoStatus getStatus() {
		return status;
	}
	@Override
	public void setStatus(CartaoStatus status) {
		this.status = status;
	}
	@Override
	public LocalDateTime getDtInicio() {
		return dtInicio;
	}
	@Override
	public void setDtInicio(LocalDateTime dtInicio) {
		this.dtInicio = dtInicio;
	}
	@Override
	public LocalDateTime getDtFim() {
		return dtFim;
	}
	@Override
	public void setDtFim(LocalDateTime dtFim) {
		this.dtFim = dtFim;
	}
}
