package br.com.rar.taskmanager.model.commons;

import java.time.LocalDateTime;
import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;

@MappedSuperclass
public abstract class Cartao implements ICartao {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String titulo;

    @Column(name = "descricao")
    private String desc;

    @Enumerated(EnumType.STRING)
    private CartaoStatus status;

    private LocalDateTime dtInicio;

    private LocalDateTime dtFim;

    @PrePersist
    protected void onPrePersist() {
        this.dtInicio = LocalDateTime.now();
    }

    @PreUpdate
    protected void onPreUpdate() {
        // reservado para futuras atualizações
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