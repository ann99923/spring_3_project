package com.tam.model;

import java.util.Arrays;

public class Criteria { //기준
   
   //현재 페이지를 나타내는 변수 선언
   private int pageNum;
   
   //한 페이지 당 보여주는 게시물 갯수
   private int amount;
   
   //검색 키워드
   private String keyword;
   
   //검색 타입
   private String type;
   
   //검색 타입의 배열
   private String[] typeArr;
   
   public Criteria() {
      this(1,10); // 한 페이지에 10개씩 보여주겠다!
   }
   
   public Criteria(int pageNum, int amount) {
      //Overloading
      this.pageNum = pageNum;
      this.amount = amount;
   }

   public int getPageNum() {
      return pageNum;
   }

   public void setPageNum(int pageNum) {
      this.pageNum = pageNum;
   }

   public int getAmount() {
      return amount;
   }

   public void setAmount(int amount) {
      this.amount = amount;
   }
   
   public String getKeyword() {
      return keyword;
   }

   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }
   
   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
      this.typeArr = type.split("");
   }
   
   public String[] getTypeArr() {
      return typeArr;
   }

   public void setTypeArr(String[] typeArr) {
      this.typeArr = typeArr;
   }

   @Override
   public String toString() {
      return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
            + ", typeArr=" + Arrays.toString(typeArr) + "]";
   }
   
}