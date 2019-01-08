package com.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "agendamento")
public class Agendamento {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;

	@Column(name = "dth_entrega")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataDeEntrega;

	// Funcionário responsável por atender o agendamento
	@Column(name = "usuario_id")
	private Integer usuario_id;

	@ManyToOne
	@JoinColumn(name = "usuario_id", insertable = false, updatable = false)
	private Usuario usuario;

	@Column(name = "venda_id")
	private Integer venda_id;

	@ManyToOne
	@JoinColumn(name = "venda_id", insertable = false, updatable = false)
	private Venda venda;

	@Column(name = "status_id")
	private Integer status_id;

	@ManyToOne
	@JoinColumn(name = "status_id", insertable = false, updatable = false)
	private Status status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getDataDeEntrega() {
		return dataDeEntrega;
	}

	public void setDataDeEntrega(Date dataDeEntrega) {
		this.dataDeEntrega = dataDeEntrega;
	}

	public Integer getUsuario_id() {
		return usuario_id;
	}

	public void setUsuario_id(Integer usuario_id) {
		this.usuario_id = usuario_id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Integer getVenda_id() {
		return venda_id;
	}

	public void setVenda_id(Integer venda_id) {
		this.venda_id = venda_id;
	}

	public Venda getVenda() {
		return venda;
	}

	public void setVenda(Venda venda) {
		this.venda = venda;
	}

	public Integer getStatus_id() {
		return status_id;
	}

	public void setStatus_id(Integer status_id) {
		this.status_id = status_id;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

}