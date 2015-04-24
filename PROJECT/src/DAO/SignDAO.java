package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.SignDTO;

public class SignDAO {

   DataSource ds;
   Connection conn;
   PreparedStatement pstmt;
   ResultSet rs;

   public SignDAO() {
      try {
         Context context = new InitialContext();
         ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
      } catch (Exception e) {
         System.out.println("DB���� ����:" + e);
         return;
      }
   }

   // ========== ���繮���ۼ����� ����޴»�� ���ϱ� ==============================================
   public String getGetSignName() {

      String getGetSign_sql = "select e.ename, g.gradename"
            + "from emp e join grade g" + "on e.grade = g.grade" + "where ";

      String[] searchGS = { "e.grade = ?" + ", deptcode = ?",
            ", teamname = '?'" };

      try {
         conn = ds.getConnection();

         for (int i = 0;; i++) {
            getGetSign_sql = getGetSign_sql + searchGS[i];
            pstmt = conn.prepareStatement(getGetSign_sql);
         
            /*
             * pstmt.setInt(1, ); �� ���޵���� - 1 
             * pstmt.setInt(2, ); �� �μ�
             * pstmt.setString(3, ); �� ��
             */

            rs = pstmt.executeQuery();
         
            if (rs.getRow() != 1) {
               String getGetSignName = (rs.getString(1) + " " + rs
                     .getString(2));
               return getGetSignName;
            }
         }
      }

      catch (Exception ex) {
         System.out.println("");
      }

      finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }

      return null;
   }
   // ========== ���繮���ۼ����� ����޴»�� ���ϱ� �� ===========================================
   
   // ========== ���繮�� �ۼ�(���, ��κ���)=====================================================
   public boolean Sign(SignDTO sign) {

      String getGetSign_sql = "select empno from emp where";

      String[] searchGS = { "e.grade = ?" + ", deptcode = ?",
            ", teamname = '?'" };

      int getSign = 0;
      
      int getSignNum = 0;

      try {
         conn = ds.getConnection();

         for (int i = 0;; i++) {
            
            getGetSign_sql = getGetSign_sql + searchGS[i];
            pstmt = conn.prepareStatement(getGetSign_sql);

            /*
             * pstmt.setInt(1, ); �� ���޵���� - 1 
             * pstmt.setInt(2, ); �� �μ�
             * pstmt.setString(3, ); �� ��
             */
            
            rs = pstmt.executeQuery();
            
            if (rs.getRow() != 1) {
               getSign = rs.getInt(1);
               break;
            }
         }
         
         String getSignNum_sql =  "select max(signnum) from sign";
         pstmt = conn.prepareStatement(getSignNum_sql);
         rs = pstmt.executeQuery();
      
         getSignNum =  rs.getInt(1);
         
         String startSign_sql = "insert into sign (signnum, starter, empno, getsign, title, content"
               + "write_date, ref, step, status) values(?,?,?,?,?,?,sysdate,?,?,?)";
         
         pstmt = conn.prepareStatement(startSign_sql);
         
         pstmt.setInt(1, getSignNum);
         pstmt.setInt(2, sign.getStarter()); //�����
         pstmt.setInt(3, sign.getEmpno()); //�� ���
         pstmt.setInt(4, getSign); 
         pstmt.setString(5, sign.getTitle());
         pstmt.setString(6, sign.getContent());
         //sysdate
         pstmt.setInt(7, sign.getRef());
         pstmt.setInt(8, sign.getStep());
         pstmt.setString(8, sign.getStatus());
         
      } catch (SQLException e) {
         e.printStackTrace();
      }

      finally {
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException ex) {
            }
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException ex) {
            }
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException ex) {
            }
      }

      return false;
   }
   // ========== ���繮�� �ۼ�(���, ��κ���) ��==================================================
   
   // ========== ���� ���� �� ========================
      public List<SignDTO> getGetSignList(int page, int limit) {
         String getGetSignList_sql = "select * from sign where getsign = empno";
         
         List list = new ArrayList<SignDTO>();
         
         int startrow = (page - 1) * 10 + 1;
         int endrow = startrow + limit - 1;
         
         try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(getGetSignList_sql);
            pstmt.setInt(1, startrow);
            pstmt.setInt(2, endrow);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
               SignDTO SignBoard = new SignDTO(); // �� ����
               SignBoard.setSignnum(rs.getInt("SIGNNUM"));
               SignBoard.setStarter(rs.getInt("STARTER"));
               SignBoard.setEmpno(rs.getInt("EMPNO"));
               SignBoard.setGetsign(rs.getInt("GETSIGN"));
               SignBoard.setTitle(rs.getString("TITLE"));
               SignBoard.setContent(rs.getString("CONTENT"));
               SignBoard.setWrite_date(rs.getDate("WRITE_DATE"));
               SignBoard.setRef(rs.getInt("REF"));
               // SignBoard.setStep(rs.getInt("STEP"));
               SignBoard.setStatus(rs.getString("STATUS"));
               list.add(SignBoard); // key point (�������� ������ collection���)
            }
            
            return list;
         } catch (Exception ex) {
            System.out.println("SignBoard ���� : " + ex);
         } finally {
            if (rs != null)
               try {
                  rs.close();
               } catch (SQLException ex) {
               }
            if (pstmt != null)
               try {
                  pstmt.close();
               } catch (SQLException ex) {
               }
            if (conn != null)
               try {
                  conn.close();
               } catch (SQLException ex) {
               }
         }
         return null;
      }
   // ========== ���� ���� �������� �����������繮�� ��========================
      
   // ========== �������º� �з� =======================================
}