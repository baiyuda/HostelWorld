package edu.nju.hostelworld.service;

import edu.nju.hostelworld.model.Record;
import edu.nju.hostelworld.model.User;
import edu.nju.hostelworld.vo.RecordVo;
import edu.nju.hostelworld.vo.UserVo;

import java.util.List;

/**
 * Created by yyy on 2017/3/10.
 */
public interface UserService {

    User saveUser(User user);

    User updateUser(User user);

    void deleteUser(String username);

    User findUser(String username, String password);

    User findUser(String username);

    boolean isCardExist(String cardId);

    UserVo stopUser(String username);


/***********************************我是洗心革面的分割线*************************************************/
    /**
     * 新增一名用户
     * @param username 用户名
     * @param password 密码
     * @param cardId 卡号
     * @param bankAccount 银行账户
     * @return {@link UserVo}
     */
    UserVo saveUser(String username,String password,String cardId,String bankAccount);

    /**
     * 会员充值
     * @param userId 用户id
     * @param topValue 充值金额
     * @return {@link UserVo}
     */
    UserVo topUp(int userId,double topValue);

    /**
     * 积分兑换
     * @param userId 用户id
     * @param credit 要兑换的积分值
     * @return
     */
    UserVo changeCredit(int userId,int credit);

    /**
     * 修改密码
     * @param userId 用户id
     * @param password 新密码
     * @return
     */
    UserVo changePwd(int userId,String password);


    List<UserVo> findAllUser();

    /**
     * 新增账户记录
     * @param message 理由
     * @param money 金额
     * @param user 用户
     * @return
     */
    RecordVo saveRecord(String message, double money, User user);

    /**
     * 获取用户账户记录列表
     * @param userId 用户id
     * @return
     */
    List<RecordVo> getRecordList(int userId);

    /**
     * 用户支付
     * @param user
     * @param money
     * @return
     */
    UserVo pay(User user,double money);

    /**
     * 用户余额变化
     * @param user
     * @param money
     * @return
     */
    User addBalance(User user,double money);

    /**
     * 通过id查找用户
     * @param userId
     * @return
     */
    UserVo findUserById(int userId);


    void checkUserState();




}
