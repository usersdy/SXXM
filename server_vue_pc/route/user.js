const express=require("express")
const router=express.Router()
const pool=require("../pool");

//注册接口
//验证用户名是不是被注册了
router.get('/uname',(req,res)=>{
    var $uname=req.query.uname;
    console.log($uname)
    var sql='select*from  tplink_user where uname=?';
    pool.query(sql,[$uname],(err,result)=>{
        if(err) throw err;
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8", 
        })
        if(result.length!=0){
            res.write(JSON.stringify({code:0,msg:"昵称已被注册!"}))
        }else{
            res.write(JSON.stringify({code:1,msg:"昵称可用√"}))
        }
        res.end();
    })
})

//获取注册信息接口
router.post('/register',(req,res)=>{
    var obj=req.body;
    console.log(obj)
    var sql='insert into  tplink_user set ?';
    pool.query(sql,[obj],(err,result)=>{
    if(err) throw err;
    res.writeHead(200,{
        "Content-Type":"application/json;charset=utf-8",
    })
    console.log(result)
    if(result.affectedRows!=0){
        res.write(JSON.stringify({code:1,msg:"注册成功"}))
    }else{
        res.write(JSON.stringify({code:0,msg:"注册失败"}))
    }
    res.end()
    })
})

//用户登录接口
router.post('/login',(req,res)=>{
    console.log(req.body)
    var $uname=req.body.uname
    var $upwd=req.body.upwd
    var sql='select*from  tplink_user where uname=? and upwd=?';
    pool.query(sql,[$uname,$upwd],(err,result)=>{
        if(err) throw err;
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
        });
        console.log(result)
        if(result.length!=0){
            user=[result[0].uid,result[0].uname]
            res.write(JSON.stringify({code:1,msg:user}))
        }else{
            res.write(JSON.stringify({code:0,msg:"用户名或者密码有误"}))
        }
        res.end()
    })
})


//导出
module.exports=router;