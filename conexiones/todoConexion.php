<?php
class dbconexion{

    private $conn=null;
    private $servername = "localhost";
    private $myDB = "gcindust";
    private $username = "root";
    private $password = "";//root
    
    public function __construct()
    {
        
    }

    public function addP($query_statement)
    {       
       
        $er=null;
        $ok=true;
        
        try {
        $this->conn = new PDO("mysql:host=$this->servername;dbname=$this->myDB", $this->username, $this->password);
        // set the PDO error mode to exception
        $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        // $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
       // eConnected successfully";
        $ok=$this->conn->exec($query_statement);
        
         } catch(PDOException $e) {
            $er='Error en datos ya existentes.['.$e->getMessage(); 
            $ok=false; 
           // php_console_log($e);          
        }
        $this->conn=null;
        return  ['status'=>$ok,'error'=>$er,'qr'=>$query_statement];       
    }
    public function findAll_By($query_statement)
    {       
        // $servername = "localhost";
        // $myDB = "lsvgsg2025";
        // $username = "root";
        // $password = "";
        $er=null;
        $ok=true;
        //new PDO("mysql:host=localhost;dbname=lsvgsg2025","root","root");  
        try {
        $conn = new PDO("mysql:host=$this->servername;dbname=$this->myDB", $this->username, $this->password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        // $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        // echo "Connected successfully";
        // echo $qry;
        $er=$conn->query($query_statement)->fetchAll();//
        // php_console_log($err,'llego aqui?');!=null?'vacio' :$err
            
        } catch(PDOException $e) {
            $ok=false;//die($conn->getMessage());
            $er=$e->getMessage();
        }
        $conn=null;
        return  ['status'=>$ok,'info'=>$er,'qr'=>$query_statement];
    }

    /**
     * Find without All att
     */
    public function find_By($query_statement)
    {       
        $er=null;
        $ok=true;
         
        try {
        $conn = new PDO("mysql:host=$this->servername;dbname=$this->myDB", $this->username, $this->password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        // $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        // echo "Connected successfully";
        // echo $qry;
        $er=$conn->query($query_statement)->fetch();//
        // php_console_log($err,'llego aqui?');!=null?'vacio' :$err
            
        } catch(PDOException $e) {
            $ok=false;//die($conn->getMessage());
            $er=$e->getMessage();
        }
        $conn=null;
        return  ['status'=>$ok,'info'=>$er,'qr'=>$query_statement];
    }

    public function getAll_OrderBy($table_name,$table_sort_key)
    {       
        $er=null;
        $ok=true;
        try {
        $conn = new PDO("mysql:host=$this->servername;dbname=$this->myDB", $this->username, $this->password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        // $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        // echo "Connected successfully";
        $qry=" SELECT * from $table_name order by $table_sort_key ASC";
        // echo $qry;
        $er=$conn->query($qry)->fetchAll();//
        // php_console_log($err,'llego aqui?');!=null?'vacio' :$err
            
        } catch(PDOException $e) {
            $ok=false;//die($conn->getMessage());
            $er=$e->getMessage();
        }
        $conn=null;
        return  ['status'=>$ok,'info'=>$er,'qr'=>$qry];
    }
}
