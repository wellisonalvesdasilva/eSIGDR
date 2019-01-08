package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cardapio_venda")
public class CardapioVenda {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "venda_id")
	private Venda venda;

	@ManyToOne
	@JoinColumn(name = "cardapio_id", insertable = false, updatable = false)
	private Cardapio cardapio;

	@Column(name = "cardapio_id")
	private Integer cardapio_id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Venda getVenda() {
		return venda;
	}

	public void setVenda(Venda venda) {
		this.venda = venda;
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

}