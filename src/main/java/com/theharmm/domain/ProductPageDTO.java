package com.theharmm.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ProductPageDTO {
	private int totalCnt;
	private List<ProductDTO> list;
}
