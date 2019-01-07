package com.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "venda")
public class Venda {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;

	@Column(name = "dth_venda")
	private Date dataDaVenda;

	@ManyToOne
	@JoinColumn(name = "cliente_id", insertable = false, updatable = false)
	private Cliente cliente;

	@Column(name = "cliente_id")
	private Integer cliente_id;

	@ManyToOne
	@JoinColumn(name = "agendamento_id", insertable = false, updatable = false)
	private Agendamento agendamento;

	// Operador de caixa
	@Column(name = "usuario_id")
	private Integer usuario_id;

	@ManyToOne
	@JoinColumn(name = "usuario_id", insertable = false, updatable = false)
	private Usuario usuario;

	@Column(name = "agendamento_id")
	private Integer agendamento_id;

	@ManyToOne
	@JoinColumn(name = "cardapio_id", insertable = false, updatable = false)
	private Cardapio cardapio;

	@Column(name = "cardapio_id")
	private Integer cardapio_id;

	@Column(name = "quantidade")
	private Integer qtde;

	@Column(name = "obs")
	private String obs;

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

	public Date getDataDaVenda() {
		return dataDaVenda;
	}

	public void setDataDaVenda(Date dataDaVenda) {
		this.dataDaVenda = dataDaVenda;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Integer getCliente_id() {
		return cliente_id;
	}

	public void setCliente_id(Integer cliente_id) {
		this.cliente_id = cliente_id;
	}

	public Agendamento getAgendamento() {
		return agendamento;
	}

	public void setAgendamento(Agendamento agendamento) {
		this.agendamento = agendamento;
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

	public Integer getAgendamento_id() {
		return agendamento_id;
	}

	public void setAgendamento_id(Integer agendamento_id) {
		this.agendamento_id = agendamento_id;
	}

	public Cardapio getCardapio() {
		return cardapio;
	}

	public void setCardapio(Cardapio cardapio) {
		this.cardapio = cardapio;
	}

	public Integer getCardapio_id() {
		return cardapio_id;
	}

	public void setCardapio_id(Integer cardapio_id) {
		this.cardapio_id = cardapio_id;
	}

	public Integer getQtde() {
		return qtde;
	}

	public void setQtde(Integer qtde) {
		this.qtde = qtde;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
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