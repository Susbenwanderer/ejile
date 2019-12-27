package com.qtztlink.ejile.system.dao.goods.impl;

import com.qtztlink.ejile.system.dao.goods.ShoppingCartDao;
import com.qtztlink.ejile.system.mapper.goods.ShoppingCartMapper;
import com.qtztlink.ejile.system.model.goods.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Types;
import java.util.List;

@Repository("shoppingCartDao")
public class ShoppingCartDaoImpl implements ShoppingCartDao {


    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int addShoppingCartItem(ShoppingCart shoppingCart) {
        String sql = "insert into shoppingcart values(?, ?, ?, ?)";
        Object[] args = {
                shoppingCart.getCid(),
                shoppingCart.getGid(),
                shoppingCart.getNum(),
                shoppingCart.getTotal()
        };
        int[] argTypes = {
                Types.INTEGER,
                Types.INTEGER,
                Types.INTEGER,
                Types.DECIMAL
        };
        return this.jdbcTemplate.update(sql, args, argTypes);
    }


    @Override
    public int updateShoppingCartItem(ShoppingCart shoppingCart) {
        String sql = "update shoppingcart set num=?, total=? where cid=? and gid=?";
        Object[] args = {
                shoppingCart.getNum(),
                shoppingCart.getTotal(),
                shoppingCart.getCid(),
                shoppingCart.getGid()
        };
        int[] argTypes = {
                Types.INTEGER,
                Types.INTEGER,
                Types.INTEGER,
                Types.DECIMAL
        };
        return this.jdbcTemplate.update(sql, args, argTypes);
    }

    @Override
    public int deleteShoppingCartItemById(Integer cid, Integer gid) {
        String sql = "delete from shoppingcart where cid=? and gid=?";
        Object[] args = { cid, gid};
        int[] argTypes = {
                Types.INTEGER,
                Types.INTEGER
        };
        return this.jdbcTemplate.update(sql, args, argTypes);
    }

    @Override
    public int clearShoppingCart(Integer cid) {
        String sql = "delete from shoppingcart where cid=?";
        Object[] args = {cid};
        int[] argTypes = {Types.INTEGER};
        return this.jdbcTemplate.update(sql, args, argTypes);
    }

    @Override
    public int clearShoppingCartByCidSid(Integer cid, Integer sid) {
        String sql = "delete from shoppingcart where cid=? and GID in (select GID from goods where sId = ?)";
        Object[] args = {cid, sid};
        int[] argTypes = {Types.INTEGER, Types.INTEGER};
        return this.jdbcTemplate.update(sql, args, argTypes);
    }

    @Override
    public List<ShoppingCart> queryShoppingCartByCID(Integer CID) {
        String sql = "select * from shoppingcart_view where cid = ?";
        Object[] args = {CID};
        int[] argTypes = {Types.INTEGER};
        List<ShoppingCart> shoppingCartList = this.jdbcTemplate.query(sql, args,
                argTypes, new ShoppingCartMapper());
        if (shoppingCartList != null && shoppingCartList.size() > 0) {
            return shoppingCartList;
        } else {
            return null;
        }
    }

    @Override
    public List<ShoppingCart> queryShoppingCartByCIDSID(Integer CID, Integer SID) {
        String sql = "select * from shoppingcart_view where cid = ? and sid = ?";
        Object[] args = {CID, SID};
        int[] argTypes = {Types.INTEGER, Types.INTEGER};
        List<ShoppingCart> shoppingCartList = this.jdbcTemplate.query(sql, args,
                argTypes, new ShoppingCartMapper());
        if (shoppingCartList != null && shoppingCartList.size() > 0) {
            return shoppingCartList;
        } else {
            return null;
        }
    }

    @Override
    public ShoppingCart queryShoppingCartByID(Integer CID, Integer GID) {
        String sql = "select * from shoppingcart_view where cid = ? and gid = ?";
        Object[] args = {CID, GID};
        int[] argTypes = {Types.INTEGER, Types.INTEGER};
        List<ShoppingCart> shoppingCartList = this.jdbcTemplate.query(sql, args,
                argTypes, new ShoppingCartMapper());
        if (shoppingCartList != null && shoppingCartList.size() > 0) {
            return shoppingCartList.get(0);
        }
        return null;
    }
}
