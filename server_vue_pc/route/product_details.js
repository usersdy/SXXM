const express=require("express");
const router=express.Router();
const pool=require("../pool");
const multer=require('multer');
const uuid=require('uuid');
const fs=require('fs')
// 添加评论
var uploadfile;
var path;

var storage = multer.diskStorage({
    //上传时目录的相关规则
    destination: function (req, file, cb) {
        //构建Date()对象,作为目录名称
        var now = new Date();
        var fullYear = now.getFullYear();
        var month = now.getMonth() + 1;
        month = month < 10 ? '0' + month : month;
        var day = now.getDate();

        //构建目录名称
        uploadpath='upload/' + fullYear + '-' + month + '-' + day;
        var path = 'public/'+uploadpath
        //判断目录是否存在,如果不存在则自动创建
        if (!fs.existsSync(path)) {
            fs.mkdirSync(path, (err) => {
                if (err) throw err; 
            });
        }

        cb(null, path);
    },
    //上传时文件名称的相关规则
    filename: function (req, file, cb) {
        //获取原始文件的名称
        var origin = file.originalname;

        //获取文件的扩展名
        var extension = origin.substr(origin.lastIndexOf('.') + 1);
        extension = extension.toLowerCase();

        //生成主文件名 -- 生成基于时间戳的UUID
        var main = uuid.v1();
      
        //生成新的文件名称
        filename = main + '.' + extension;
        uploadfile=filename
        cb(null, filename);
    }
});

//使用自定义规则

upload = multer({ storage: storage });
//上传评论
router.post('/comment', upload.single('face'),(req,res)=>{
    //  console.log(req.body)
    var obj=req.body;
        obj.url= 'http://127.0.0.1:5050/'+uploadpath+'/'+uploadfile
    var sql='INSERT INTO  comment SET ? ';
    var sql1='select*from comment'
    pool.query(sql,[obj],(err,result)=>{
    if(err) throw err;
    res.writeHead(200,{
        "Content-Type":"application/json;charset=utf-8",
    })
    if(result.affectedRows!=0){
        res.write(JSON.stringify({code:1,msg:"上传成功"}))
    }else{
        res.write(JSON.stringify({code:0,msg:"上传失败"}))
    }
    res.end()
    })

})

//获取评论
router.get('/get_comment',(req,res)=>{
    var sql='select*from comment';
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
        });
        // console.log(result);
        res.write(JSON.stringify({code:200,msg:result}));
        res.end()
    })
})

router.get('/',(req,res)=>{   
    $pid=req.query.pid;
    console.log($pid)
    var product,picture,detial_picture,recommend;
    var obj={product,picture,detial_picture,recommend};
    var sql=`select title,details,address,price,isAvailable  from tplink_product where pid=?`;
    var sql1=`select*from tplink_product_picture where pid=?`;
    var sql2=`select*from tplink_product_detial_picture where pid=?`;
    //相关推荐
    var sql3=`select src,title,pid,price from tplink_product limit ${2*(Math.floor(Math.random()*13))},2`;
    Promise.all([
         new Promise(function(open){
            pool.query(sql,[$pid],(err,result)=>{
                 if(err) throw err;
                 obj.product=result[0];
                 open()
            })
         }),
         new Promise(function(open){
            pool.query(sql1,[$pid],(err,result)=>{
                if(err) throw err;
                obj.picture=result;
                open()
            })
        }),
        new Promise(function(open){
            pool.query(sql2,[$pid],(err,result)=>{
                if(err) throw err;
                obj.detial_picture=result;
                open()
            })
        }),
        new Promise(function(open){
            pool.query(sql3,[$pid],(err,result)=>{
                if(err) throw err;
                obj.recommend=result;
                open()
            })
        }),
    ]).then(()=>{
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
        });
        res.write(JSON.stringify(obj))
        res.end();
    })
});



module.exports=router