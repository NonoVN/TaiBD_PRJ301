package model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import utils.JPAUtils;

public class UniversityDAO {

    public UniversityDAO() {
    }

    public List<UniversityDTO> searchByName(String name) {
        EntityManager em = JPAUtils.getEntityManager();
        try {
            String jpql
                = "SELECT u FROM UniversityDTO u "
                + "WHERE u.status = true AND u.name LIKE :name";
            List<UniversityDTO> result = em.createQuery(jpql, UniversityDTO.class)
                    .setParameter("name", name)
                    .getResultList();

            return result;
        } catch (Exception e) {
            throw e;
        } finally {
            em.close();
        }
    }

    public UniversityDTO searchByID(String ID) {
        EntityManager em = JPAUtils.getEntityManager();
        try {
            UniversityDTO u = em.find(UniversityDTO.class, ID);
            return u;
        } finally {
            em.close();
        }
    }

    // ĐÂY LÀ HÀM BẠN ĐANG THIẾU
    public List<UniversityDTO> filterByName(String name) {
        name = "%" + name + "%";
        return searchByName(name);
    }

    public boolean softDelete(String id) {
        EntityManager em = JPAUtils.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            UniversityDTO u = em.find(UniversityDTO.class, id);
            if (u != null) {
                u.setStatus(false);
            }
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }

    public boolean add(UniversityDTO u) {
        EntityManager em = JPAUtils.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(u);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }

    public boolean update(UniversityDTO u) {
        EntityManager em = JPAUtils.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(u);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }
}
