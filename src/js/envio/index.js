import { Dropdown } from "bootstrap";
import { Toast, validarFormulario } from "../funciones";
import Swal from "sweetalert2";
import DataTable from "datatables.net-bs5";
import { lenguaje } from "../lenguaje";

let contador = 1;
const datatable = new DataTable('#tablaEnvios', {
    data: null,
    language: lenguaje,
    pageLength: '15',
    lengthMenu: [3, 9, 11, 25, 100],
    columns: [
        {
            title: 'No.',
            data: 'id',
            width: '2%',
            render: (data, type, row, meta) => {
                return meta.row + 1;
            }
        },
        {
            title: 'Fecha',
            data: 'env_fecha_envio'
        },
        {
            title: 'Usuario',
            data: 'env_nombre_usuario'
        },
        {
            title: 'Origen Latitud',
            data: 'env_ori_lat'
        },
        {
            title: 'Origen Longitud',
            data: 'env_ori_lng'
        },
        {
            title: 'Destino Latitud',
            data: 'env_des_lat'
        },
        {
            title: 'Destino longitud',
            data: 'env_des_lng'
        },
        {
            title: 'Estado',
            data: 'env_estado'
        },
    ]
})


const buscar = async () => {
    try {
        const url = "/IS3_MENCOS_LUIS/API/envio/buscar"
        const config = {
            method: 'GET',
        }

        const respuesta = await fetch(url, config);
        const data = await respuesta.json();
        const { codigo, mensaje, detalle, datos } = data;
        console.log(datos);
        datatable.clear().draw();

        if (datos) {
            datatable.rows.add(datos).draw();
        }
    } catch (error) {
        console.log(error);
    }
}
buscar();