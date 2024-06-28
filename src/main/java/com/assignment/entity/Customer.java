	package com.assignment.entity;
	
	import lombok.Data;
	
	
	import java.util.Date;
	
	import org.springframework.format.annotation.DateTimeFormat;
	
	import com.fasterxml.jackson.annotation.JsonFormat;
	
	import jakarta.persistence.Column;
	import jakarta.persistence.Entity;
	import jakarta.persistence.GeneratedValue;
	import jakarta.persistence.GenerationType;
	import jakarta.persistence.Id;
	import jakarta.persistence.Table;
	import jakarta.persistence.Temporal;
	import jakarta.persistence.TemporalType;
	import jakarta.persistence.Transient;
	import jakarta.validation.constraints.Email;
	import jakarta.validation.constraints.NotBlank;
	import jakarta.validation.constraints.Pattern;
	import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;
	
	@Data
	@Entity
	@Table(name = "customer")
	public class Customer {
	
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer customerId;
	
		@NotBlank(message = "Không được để trống tên khác hàng!")
		private String name;
		
		@NotBlank(message = "Không được để trống email!")
		@Email(message = "Không đúng định dạng email!")
		private String email;
	
		@NotBlank(message = "Không được để trống mật khẩu!")
	    @Size(min = 7, message = "Mật khẩu phải có ít nhất 7 ký tự!")
		private String password;
		
		@Transient
		private String confirmPassword;
	
		@NotBlank(message = "Không được để trống SDT!")
		private String phone;
	
		@Temporal(TemporalType.DATE)
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date registeredDate;
	
		private boolean admin;
		

	}
