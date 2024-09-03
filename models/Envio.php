<?php

namespace Model;

class Envio extends ActiveRecord
{
    protected static $tabla = 'envios';
    protected static $idTabla = 'envio_id';
    protected static $columnasDB = ['envio_id', 'env_fecha_envio', 'usuario_id', 'env_ori_lat','env_ori_lng','env_des_lat','env_des_lng','env_estado',];

    public $envio_id;
    public $env_fecha_envio;
    public $env_usuario_id;
    public $env_origen_lat;
    public $env_origen_lng;
    public $env_destino_lat;
    public $env_destino_lng;
    public $env_estado;


    public function __construct($args = [])
    {
        $this->envio_id = $args['envio_id'] ?? null;
        $this->env_fecha_envio = $args['fecha_envio'] ?? '';
        $this->env_usuario_id = $args['usuario_id'] ?? null;
        $this->env_origen_lat = $args['origen_lat'] ?? '';
        $this->env_origen_lng = $args['origen_lng'] ?? '';
        $this->env_destino_lat = $args['destino_lat'] ?? '';
        $this->env_destino_lng = $args['destino_lng'] ?? '';
        $this->env_estado = $args['estado'] ?? '';
        
    }

    public static function obtenerEnviosconQuery()
    {
        $sql = "SELECT 
                e.env_fecha_envio, 
                u.nombre AS nombre_usuario, 
                e.env_origen_lat, 
                e.env_origen_lng, 
                e.env_destino_lat, 
                e.env_destino_lng, 
                e.envestado
                FROM 
                envios e
                JOIN 
                usuarios u ON e.usuario_id = u.usuario_id;";
                return self::fetchArray($sql);
    }
}
