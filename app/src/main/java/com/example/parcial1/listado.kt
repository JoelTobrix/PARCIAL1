package com.example.parcial1

import android.content.Intent
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.ListView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import org.json.JSONArray

class listado : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.listado)


        //Llamar a lafuncion
        cargarlistado()
        // Configurar el botón para crear nuevos ingresos de vehículos
        val buttonCrearIngreso = findViewById<Button>(R.id.button_crear_ingreso)
        buttonCrearIngreso.setOnClickListener {
            crearlistvehiculo()
        }

    }
    private fun cargarlistado(){
        val url = "http://192.168.100.126/vehiculo/listado.php"


        // Crear una cola de solicitudes
        val queue = Volley.newRequestQueue(this)

        // Crear la solicitud
        val stringRequest = StringRequest(
            Request.Method.GET, url,
            Response.Listener { response ->
                try {
                    // Parsear la respuesta JSON
                    val autos = ArrayList<String>()
                    val jsonArray = JSONArray(response)
                    for (i in 0 until jsonArray.length()) {
                        val jsonObject = jsonArray.getJSONObject(i)
                        val placa = jsonObject.getString("Placa")
                        val modelo = jsonObject.getString("Modelo")
                        val hora_ingreso = jsonObject.getString("Hora_ingreso")
                        val hora_salida = jsonObject.getString("Hora_salida")

                        // Formatear los datos
                        autos.add("$placa ---- $modelo ---- $hora_ingreso ----- $hora_salida")
                    }

                    // Mostrar los contactos en el ListView
                    val listView: ListView = findViewById(R.id.list_view_vehiculos)
                    val adapter = ArrayAdapter(
                        this,
                        android.R.layout.simple_list_item_1,
                        autos
                    )
                    listView.adapter = adapter
                } catch (e: Exception) {
                    e.printStackTrace()
                    Toast.makeText(this, "Error al parsear los datos", Toast.LENGTH_SHORT).show()
                }
            },
            Response.ErrorListener {
                Toast.makeText(this, "Error al conectar con el servidor", Toast.LENGTH_SHORT).show()
            }
        )

        // Agregar la solicitud a la cola
        queue.add(stringRequest)

    }
    fun crearlistvehiculo() {
        val intent= Intent(this,vehiculo:: class.java)
        startActivity(intent)

    }

}