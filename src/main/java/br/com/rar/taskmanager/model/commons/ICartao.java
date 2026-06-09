package br.com.rar.taskmanager.model.commons;

import java.time.LocalDateTime;

public interface ICartao {
	
	public Long getId();
	public void setId(Long id);
	public String getTitulo() ;
	public void setTitulo(String titulo);
	public String getDesc() ;
	public void setDesc(String desc);
	public CartaoStatus getStatus();
	public void setStatus(CartaoStatus status);
	public LocalDateTime getDtInicio();
	public void setDtInicio(LocalDateTime dtInicio);
	public LocalDateTime getDtFim();
	public void setDtFim(LocalDateTime dtFim);
}
