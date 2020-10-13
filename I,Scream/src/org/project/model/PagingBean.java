package org.project.model;

/**
 * ����¡ ó���� ���� ����Ͻ� ������ Ŭ���� PagingBean method ��������<br>
 * getStartRowNumber()<br>
 * getEndRowNumber()<br> 
 * getTotalPage()<br> 
 * getTotalPageGroup()<br>
 * getNowPageGroup()<br>
 * getStartPageOfPageGroup()<br>
 * getEndPageOfPageGroup()<br> 
 * isPreviousPageGroup()<br>
 * isNextPageGroup()<br>
 * 
 * @author kosta
 *
 */
public class PagingBean {
 /**
  * ���� ������
  */
 private int nowPage = 1;
 /**
  * �������� �Խù���
  */
 private int postCountPerPage = 5;
 /**
  * ������ �׷�� ��������
  */
 private int pageCountPerPageGroup = 4;
 /**
  * database�� ����� �ѰԽù���
  */
 private int totalPostCount;

  public PagingBean(int totalPostCount) {
  this.totalPostCount = totalPostCount;
 }

 public PagingBean(int totalPostCount, int nowPage) {
  this.totalPostCount = totalPostCount;
  this.nowPage = nowPage;
 }

 public int getNowPage() {
  return nowPage;
 }

 /**
  * ���� ��������ȣ�� �ش��ϴ� ���� �Խù��� row number�� ��ȯ <br>
  * hint : ������������ ������ ��ȣ + 1
  * 2�������� ���۹�ȣ�� 1�������� ������ ��ȣ(5) + 1 �� ���۹�ȣ�̴� 
  * @return
  */
 public int getStartRowNumber() {
  return (nowPage-1)*postCountPerPage+1;
 }

 /**
  * ���� ���������� ������ �Խù� ��(row)�� ������ ��ȣ<br>
  * ���������� postNumberPerPage ���� �ѰԽù�������<br>
  * �������� ��ȣ�� Ŭ ��� �ѰԽù����� ������ ��ȣ�� �Ǿ�� �Ѵ�<br>
  *  ex) �ѰԽù��� 7 �� ���������� 2������ : 1 2 3 4 5<br>
  * | 6 7 | 1page 2page ������������ 2�������̰� 2*5(�������� �Խù���) �� 10 �̰� <br>
  * ���� ������ ��ȣ 7�̴� -><br>
  * �������� �ѰԽù������� Ŭ ��� �ѰԽù����� ��������ȣ�� �Ǿ�� ��
  * 
  * @return
  */
 public int getEndRowNumber() {  
	 int endRowNumber=nowPage*postCountPerPage;
	 if(totalPostCount<endRowNumber)
		 endRowNumber=totalPostCount;
	 return endRowNumber;
 }

 /**
  * �� ������ ���� return�Ѵ�.<br>
  * 1. ��ü ������(�Խù�) % �� �������� ������ ������ ���� <br>
  * => 0 �̸� ���� / ���� �� ������ ��<br>
  * 2. ��ü ������(�Խù�) % �� �������� ������ ������ ���� <br>
  * => 0���� ũ�� ���� / ���� +1�� �� ���� �� ������ ��<br>
  * �Խù��� 1 2 3 4 5 6 7 8 9 10 11 12<br>
  * 1������ 1~5<br>
  * 2������ 6~10<br>
  * 3������ 11,12 <br>
  * ex) �Խù� 32 �� , �������� �Խù��� 5��-> 7 ������
  * 
  * @return
  */
 private int getTotalPage() {  
	 int num=totalPostCount%postCountPerPage;
	 int totalPage=0;
	 if(num==0) {
		 totalPage=totalPostCount/postCountPerPage;
	 }else {
		 totalPage=totalPostCount/postCountPerPage+1;
	 }
	 return totalPage;
 }

 /**
  * �� ������ �׷��� ���� return�Ѵ�.<br>
  * 1. �� �������� % Page Group �� Page ��. <br>
  * => 0 �̸� ���� / ���� �� ������ ��<br>
  * 2. �� �������� % Page Group �� Page ��. <br>
  * => 0���� ũ�� ���� / ���� +1�� �� ���� �� ������ ��<br>
  * ex) �� �Խù� �� 23 �� <br>
  * �� ������ ? �� ������ �׷�� ? <br>
  * ������ 1 2 3 4 5<br>
  * �������׷� 1234(1�׷�) 5(2�׷�)<br>
  * 
  */
 private int getTotalPageGroup() {  
	 int num=getTotalPage()%pageCountPerPageGroup;
	 int totalPageGroup=0;
	 if(num==0) {
		 totalPageGroup=getTotalPage()/pageCountPerPageGroup;
	 }else {
		 totalPageGroup=getTotalPage()/pageCountPerPageGroup+1;
	 }
	 return totalPageGroup;
 }

 /**
  * ���� �������� ���� ������ �׷� ��ȣ(�� ��° ������ �׷�����) �� return �ϴ� �޼ҵ� <br>
  * 1. ���� ������ % Page Group �� Page �� => 0 �̸� <br>
  * ���� / ���� ���� ������ �׷�. <br>
  * 2. ���� ������ % Page Group �� Page �� => 0 ũ�� <br>
  * ���� / ���� +1�� �� ���� ���� ������ �׷�<br>
  * ������ 1 2 3 4 /5 6 7 8/ 9 10 1�׷� 2�׷� 3�׷�
  * 
  * @return
  */
 private int getNowPageGroup() {  
	 int num=nowPage%pageCountPerPageGroup;
	 int nowPageGroup=0;
	 if(num==0) {
		 nowPageGroup=nowPage/pageCountPerPageGroup;
	 }else {
		 nowPageGroup=nowPage/pageCountPerPageGroup+1;
	 }
	 return nowPageGroup;
 }

 /**
  * ���� �������� ���� ������ �׷��� ���� ������ ��ȣ�� return �Ѵ�.<br>
  * Page Group �� Page ��*(���� ������ �׷� -1) + 1�� �� ���� ù �������̴�.<br>
  * (������ �׷�*������ �׷� ����, �׷��� ������ ��ȣ�̹Ƿ�) <br>
  * ������ �׷� <br>
  * 1 2 3 4 -> 5 6 7 8 -> 9 10 <br>
  * 
  * @return
  */
 public int getStartPageOfPageGroup() {  	 
	 return pageCountPerPageGroup*(getNowPageGroup()-1)+1;
 }

 /**
  * ���� �������� ���� ������ �׷��� ������ ������ ��ȣ�� return �Ѵ�.<br>
  * 1. ���� ������ �׷� * ������ �׷� ���� �� ������ ��ȣ�̴�. <br>
  * 2. �� �׷��� ������ ������ ��ȣ�� ��ü �������� ������ ������ ��ȣ���� <br>
  * ū ���� ��ü �������� ������ ��ȣ�� return �Ѵ�.<br>
  * 1 2 3 4 -> 5 6 7 8 -> 9 10
  * 
  * @return
  */
 public int getEndPageOfPageGroup() {
	 int num=getNowPageGroup()*pageCountPerPageGroup;
	 if(num>getTotalPage())
		 num=getTotalPage();
	 return num;
 }

 /**
  * ���� ������ �׷��� �ִ��� üũ�ϴ� �޼��� <br>
  * ���� �������� ���� ������ �׷��� 1���� ũ�� true<br>
  * ex ) ������ 1 2 3 4 / 5 6 7 8 / 9 10 <br>
  * 1 2 3 group
  * 
  * @return
  */
 public boolean isPreviousPageGroup() {
	 boolean flag=false;
	 if(getNowPageGroup()>1)
		 flag=true;
	 return flag;
 }

 /**
  * ���� ������ �׷��� �ִ��� üũ�ϴ� �޼��� <br>
  * ���� ������ �׷��� ������ ������ �׷�(<br>
  * ������ ������ �׷� == �� ������ �׷� ��) ���� ������ true<br>
  * * ex ) ������ <br>
  * 1 2 3 4 / 5 6 7 8 / 9 10 <br>
  * 1 2 3 group
  * 
  * @return
  */
 public boolean isNextPageGroup() {
	 boolean flag=false;
	 if(getNowPageGroup()<getTotalPageGroup())
		 flag=true;
	 return flag;
 }

 public static void main(String args[]) {
  PagingBean p = new PagingBean(47, 10);
  // ���������� ���� row number �� ��ȸ 46
  System.out.println("getBeginRowNumber:" + p.getStartRowNumber());
  // ���������� ������ row number �� ��ȸ 47
  System.out.println("getEndRowNumber:" + p.getEndRowNumber());
  // ��ü ������ �� : 10
  System.out.println("getTotalPage:" + p.getTotalPage());
  // ��ü ������ �׷� �� : 3
  System.out.println("getTotalPageGroup:" + p.getTotalPageGroup());
  System.out.println("////////////////////////////");
  p = new PagingBean(31, 6);// �Խù��� 31 ���� ������ 6
  // ���������� ���� row number �� ��ȸ 26
  System.out.println("getStartRowNumber:" + p.getStartRowNumber());
  // ���������� ������ row number �� ��ȸ 30
  System.out.println("getEndRowNumber:" + p.getEndRowNumber());
  // �Խù��� 31 -> ���������� 7 -> ���������׷�->2
 // ���� ������ �׷� : 2
  System.out.println("getNowPageGroup:" + p.getNowPageGroup());
  // ������ �׷��� ���� ������ : 5
  System.out.println("getStartPageOfPageGroup:" + p.getStartPageOfPageGroup());
   // ������ �׷��� ������ ������ : 7
  System.out.println("getEndPageOfPageGroup:" + p.getEndPageOfPageGroup());
  // ���� ������ �׷��� �ִ� �� : true
  System.out.println("isPreviousPageGroup:" + p.isPreviousPageGroup());
  // ���� ������ �׷��� �ִ� �� : false
  System.out.println("isNextPageGroup:" + p.isNextPageGroup());
 }
}



