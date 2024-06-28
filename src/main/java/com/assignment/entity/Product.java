package com.assignment.entity;

import lombok.Data;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;

	@NotBlank(message = "Không được để trống tên sản phẩm!")
	private String name;

	@NotNull(message = "Không được để trống số lượng!")
	@PositiveOrZero(message = "Số lượng phải là số không âm!")
	private Integer quantity;

	@NotNull(message = "Không được để trống giá sản phẩm!")
	@PositiveOrZero(message = "Giá sản phẩm phải là số không âm!")
	private double unitPrice;

	private String image;

	private String description;

	@NotNull(message = "Không được để trống giảm giá!")
	@PositiveOrZero(message = "Giảm giá phải là số không âm!")
	private Float discount;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;

	// @NotNull(message = "Không được để trống trạng thái!")
	private Boolean status;

	@ManyToOne
	@JoinColumn(name = "categoryId")
	@NotNull(message = "Không được để trống danh mục!")
	private Category category;
}
